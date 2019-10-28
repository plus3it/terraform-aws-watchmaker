ARCH ?= amd64
OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:'])
CURL ?= curl --fail -sSL
XARGS ?= xargs -I {}

BIN_DIR ?= ${HOME}/bin
PATH := $(BIN_DIR):$(PATH)

FIND_EXCLUDES ?= -not \( -name .terraform -prune \)

VERSION ?= $$(grep -E '^current_version' .bumpversion.cfg | sed 's/^.*= //')

MAKEFLAGS += --no-print-directory
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.SUFFIXES:

.PHONY: %/lint %/format %/install

GITHUB_ACCESS_TOKEN ?= 4224d33b8569bec8473980bb1bdb982639426a92
# Macro to return the download url for a github release
# For latest release, use version=latest
# To pin a release, use version=tags/<tag>
# $(call parse_github_download_url,owner,repo,version,asset select query)
parse_github_download_url = $(CURL) https://api.github.com/repos/$(1)/$(2)/releases/$(3)?access_token=$(GITHUB_ACCESS_TOKEN) | jq --raw-output  '.assets[] | select($(4)) | .browser_download_url'

# Macro to download a github binary release
# $(call download_github_release,file,owner,repo,version,asset select query)
download_github_release = $(CURL) -o $(1) $(shell $(call parse_github_download_url,$(2),$(3),$(4),$(5)))

# Macro to download a hashicorp archive release
# $(call download_hashicorp_release,file,app,version)
download_hashicorp_release = $(CURL) -o $(1) https://releases.hashicorp.com/$(2)/$(3)/$(2)_$(3)_$(OS)_$(ARCH).zip

# Macro to download a hashicorp archive release
# $(call download_hashicorp_release,file,app,version)
download_hashicorp_release = $(CURL) -o $(1) https://releases.hashicorp.com/$(2)/$(3)/$(2)_$(3)_$(OS)_$(ARCH).zip

guard/env/%:
	@ _="$(or $($*),$(error Make/environment variable '$*' not present))"

guard/program/%:
	@ which $* > /dev/null || $(MAKE) $*/install

$(BIN_DIR):
	@ echo "[make]: Creating directory '$@'..."
	mkdir -p $@

install/gh-release/%: guard/env/FILENAME guard/env/OWNER guard/env/REPO guard/env/VERSION guard/env/QUERY
install/gh-release/%:
	@ echo "[$@]: Installing $*..."
	$(call download_github_release,$(FILENAME),$(OWNER),$(REPO),$(VERSION),$(QUERY))
	chmod +x $(FILENAME)
	$* --version
	@ echo "[$@]: Completed successfully!"

jinja2/install:
	pip install --user -r _requirements/jinja2-cli.txt

terraform/install: TERRAFORM_VERSION_LATEST := $(CURL) https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version' | sed 's/^v//'
terraform/install: TERRAFORM_VERSION ?= $(shell $(TERRAFORM_VERSION_LATEST))
terraform/install: | $(BIN_DIR) guard/program/jq
	@ echo "[$@]: Installing $(@D)..."
	$(call download_hashicorp_release,$(@D).zip,$(@D),$(TERRAFORM_VERSION))
	unzip $(@D).zip && rm -f $(@D).zip && chmod +x $(@D)
	mv $(@D) "$(BIN_DIR)"
	$(@D) --version
	@ echo "[$@]: Completed successfully!"

tfdocs-awk/install: $(BIN_DIR)
tfdocs-awk/install: ARCHIVE := https://github.com/plus3it/tfdocs-awk/archive/master.tar.gz
tfdocs-awk/install:
	$(CURL) $(ARCHIVE) | tar -C $(BIN_DIR) --strip-components=1 --wildcards '*.sh' --wildcards '*.awk' -xzvf -

terraform-docs/install: TFDOCS_VERSION ?= latest
terraform-docs/install: | $(BIN_DIR) guard/program/jq
	@ $(MAKE) install/gh-release/$(@D) FILENAME="$(BIN_DIR)/$(@D)" OWNER=segmentio REPO=$(@D) VERSION=$(TFDOCS_VERSION) QUERY='.name | endswith("$(OS)-$(ARCH)")'

jq/install: JQ_VERSION ?= latest
jq/install: | $(BIN_DIR)
	@ $(MAKE) install/gh-release/$(@D) FILENAME="$(BIN_DIR)/$(@D)" OWNER=stedolan REPO=$(@D) VERSION=$(JQ_VERSION) QUERY='.name | endswith("$(OS)64")'

shellcheck/install: SHELLCHECK_VERSION ?= latest
shellcheck/install: SHELLCHECK_URL ?= https://storage.googleapis.com/shellcheck/shellcheck-${SHELLCHECK_VERSION}.linux.x86_64.tar.xz
shellcheck/install: $(BIN_DIR) guard/program/xz
	$(CURL) $(SHELLCHECK_URL) | tar -xJv
	mv $(@D)-*/$(@D) $(BIN_DIR)
	rm -rf $(@D)-*
	$(@D) --version

terraform/lint: | guard/program/terraform
	@ echo "[$@]: Linting Terraform files..."
	terraform fmt -check=true -diff=true
	@ echo "[$@]: Terraform files PASSED lint test!"

json/%: FIND_JSON := find . $(FIND_EXCLUDES) -name '*.json' -type f
json/lint: | guard/program/jq
	@ echo "[$@]: Linting JSON files..."
	$(FIND_JSON) | $(XARGS) bash -c 'cmp {} <(jq --indent 4 -S . {}) || (echo "[{}]: Failed JSON Lint Test"; exit 1)'
	@ echo "[$@]: JSON files PASSED lint test!"

json/format: | guard/program/jq
	@ echo "[$@]: Formatting JSON files..."
	$(FIND_JSON) | $(XARGS) bash -c 'echo "$$(jq --indent 4 -S . "{}")" > "{}"'
	@ echo "[$@]: Successfully formatted JSON files!"

sh/%: FIND_SH := find . $(FIND_EXCLUDES) -name '*.sh' -type f -print0
sh/lint: | guard/program/shellcheck
	@ echo "[$@]: Linting shell scripts..."
	$(FIND_SH) | $(XARGS) shellcheck {}
	@ echo "[$@]: Shell scripts PASSED lint test!"

yaml/lint: | guard/program/yamllint
	yamllint --strict .

cfn/%: FIND_CFN ?= find . $(FIND_EXCLUDES) -name '*.template.cfn.*' -type f
cfn/lint: | guard/program/cfn-lint
	$(FIND_CFN) | $(XARGS) cfn-lint -t {}

cfn/version:
	$(FIND_CFN) | $(XARGS) bash -c "yq -e '.Metadata.Version | test(\"^$(VERSION)$$\")' {} > /dev/null || (echo '[{}]: BAD/MISSING Cfn Version Metadata'; exit 1)"

eclint/lint: | guard/program/eclint
	@ echo "[$@]: Linting all files with eclint..."
	eclint check
	@ echo "[$@]: All files PASSED lint test!"

docs/%: FOUND_DIR ?= find ${@F} -type d \( -name "lx*" -o -name "win*" \)
docs/%: README_DIR ?= .
docs/%: README_BASE ?= _docs/MAIN.md.jinja
docs/%: README_MAIN := $(README_DIR)/MAIN.md
docs/%: README_PARTS ?= $(README_MAIN) <(echo) <($(BIN_DIR)/terraform-docs.sh markdown $(README_DIR))
docs/%: README_FILE ?= $(README_DIR)/README.md

docs/template: | guard/program/jinja2
	@ echo "[$@/$(README_DIR)]: Templating doc..."
	jinja2 -D name=$(README_DIR) $(README_BASE) > $(README_MAIN)

docs/lint: | guard/program/terraform-docs
	@ echo "[$@/$(README_DIR)]: Linting documentation file.."
	diff $(README_FILE) <(cat $(README_PARTS))
	@ echo "[$@/$(README_DIR)]: Documentation file PASSED lint test!"

docs/generate: | guard/program/terraform-docs
	@ echo "[$@/$(README_DIR)]: Creating documentation file.."
	cat $(README_PARTS) > $(README_FILE)
	@ echo "[$@/$(README_DIR)]: Completed successfully!"

docs/template/%: | %
	@ echo "[$@]: Templating documentation main file.."
	$(FOUND_DIR) | $(XARGS) $(MAKE) docs/template README_DIR={}
	@ echo "[$@]: Completed successfully!"

docs/lint/%: | docs/template/% tfdocs-awk/install
	@ echo "[$@]: Starting documentation linting for $(@F).."
	$(FOUND_DIR) | $(XARGS) $(MAKE) docs/lint README_DIR={}
	@ echo "[$@]: Linting documents for $(@F) complete!"

docs/generate/%: | docs/template/% tfdocs-awk/install
	@ echo "[$@]: Start generating documentations for $(@F).."
	$(FOUND_DIR) | $(XARGS) $(MAKE) docs/generate README_DIR={}
	@ echo "[$@]: Generate documentations for $(@F) complete!"
