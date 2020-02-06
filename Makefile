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

-include $(shell curl -sSL -o .tardigrade-ci "https://raw.githubusercontent.com/plus3it/tardigrade-ci/master/bootstrap/Makefile.bootstrap"; echo .tardigrade-ci)

guard/program/%:
	@ which $* > /dev/null || $(MAKE) $*/install

cfn/%: FIND_CFN ?= find . $(FIND_EXCLUDES) -name '*.template.cfn.*' -type f
cfn/version: guard/program/yq
cfn/version:
	$(FIND_CFN) | $(XARGS) bash -c "yq -e '.Metadata.Version | test(\"^$(VERSION)$$\")' {} > /dev/null || (echo '[{}]: BAD/MISSING Cfn Version Metadata'; exit 1)"

cfn/lint: | guard/program/cfn-lint
	$(FIND_CFN) | $(XARGS) cfn-lint -t {}
