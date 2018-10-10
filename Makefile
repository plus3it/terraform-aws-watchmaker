ARCH ?= amd64
OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:'])
CURL ?= curl --fail -sSL
XARGS ?= xargs -I {}

BIN_DIR ?= ${HOME}/bin
PATH := $(BIN_DIR):$(PATH)

VERSION ?= $$(grep -E '^current_version' .bumpversion.cfg | sed 's/^.*= //')

MAKEFLAGS += --no-print-directory
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.SUFFIXES:

.PHONY: %/lint %/format %/install

# Macro to download a hashicorp archive release
# $(call download_hashicorp_release,file,app,version)
download_hashicorp_release = $(CURL) -o $(1) https://releases.hashicorp.com/$(2)/$(3)/$(2)_$(3)_$(OS)_$(ARCH).zip

guard/program/%:
	@ which $* > /dev/null || $(MAKE) $*/install

terraform/install: TERRAFORM_VERSION ?= $(shell $(CURL) https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')
terraform/install: | $(BIN_DIR)
	@ echo "[$@]: Installing $(@D)..."
	$(call download_hashicorp_release,$(@D).zip,$(@D),$(TERRAFORM_VERSION))
	unzip $(@D).zip && rm -f $(@D).zip && chmod +x $(@D)
	mv $(@D) "$(BIN_DIR)"
	$(@D) --version
	@ echo "[$@]: Completed successfully!"

jq/install: JQ_VERSION ?= jq-1.5
jq/install: JQ_URL ?= https://github.com/stedolan/jq/releases/download/$(JQ_VERSION)/jq-linux64
jq/install: | $(BIN_DIR)
	@ echo "[$@]: Installing $(@D)..."
	@ echo "[$@]: JQ_URL=$(JQ_URL)"
	$(CURL) -o $(BIN_DIR)/$(@D) "$(JQ_URL)"
	chmod +x $(BIN_DIR)/$(@D)
	$(@D) --version
	@ echo "[$@]: Completed successfully!"

terraform/lint: | guard/program/terraform
	@ echo "[$@]: Linting Terraform files..."
	terraform fmt -check=true -diff=true
	@ echo "[$@]: Terraform files PASSED lint test!"

json/%: FIND_JSON := find . -name '*.json' -type f
json/lint: | guard/program/jq
	@ echo "[$@]: Linting JSON files..."
	$(FIND_JSON) | $(XARGS) bash -c 'cmp {} <(jq --indent 4 -S . {}) || (echo "[{}]: Failed JSON Lint Test"; exit 1)'
	@ echo "[$@]: JSON files PASSED lint test!"

json/format: | guard/program/jq
	@ echo "[$@]: Formatting JSON files..."
	$(FIND_JSON) | $(XARGS) bash -c 'echo "$$(jq --indent 4 -S . "{}")" > "{}"'
	@ echo "[$@]: Successfully formatted JSON files!"

sh/%: FIND_SH ?= find . -name '*.sh' -type f
sh/lint: | guard/program/shellcheck
	$(FIND_SH) | $(XARGS) shellcheck {}

yaml/lint: | guard/program/yamllint
	yamllint --strict .

cfn/%: FIND_CFN ?= find . -name '*.template.cfn.*' -type f
cfn/lint: | guard/program/cfn-lint
	$(FIND_CFN) | $(XARGS) cfn-lint -t {}

cfn/version:
	$(FIND_CFN) | $(XARGS) bash -c "jq -e '.Metadata.Version | test(\"^$(VERSION)$$\")' {} > /dev/null || (echo '[{}]: BAD/MISSING Cfn Version Metadata'; exit 1)"
