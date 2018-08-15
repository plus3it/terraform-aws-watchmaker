FIND_JSON ?= find . -name '*.json' -type f
FIND_SH ?= find . -name '*.sh' -type f
FIND_CFN ?= find . -name '*.template.cfn.*' -type f
XARGS_CMD ?= xargs -I {}
VERSION ?= $$(grep -E '^current_version' .bumpversion.cfg | sed 's/^.*= //')

.PHONY: json.lint
json.lint:
	$(FIND_JSON) | $(XARGS_CMD) bash -c 'cmp {} <(jq --indent 4 -S . {}) || (echo "[{}]: Failed JSON Lint Test"; exit 1)'

.PHONY: sh.lint
sh.lint:
	$(FIND_SH) | $(XARGS_CMD) shellcheck {}

.PHONY: yaml.lint
yaml.lint:
	yamllint --strict .

.PHONY: tf.lint
tf.lint:
	terraform fmt -check=true

.PHONY: cfn.lint
cfn.lint:
	$(FIND_CFN) | $(XARGS_CMD) cfn-lint -t {}

.PHONY: cfn.version
cfn.version:
	$(FIND_CFN) | $(XARGS_CMD) bash -c "jq -e '.Metadata.Version | test(\"^$(VERSION)$$\")' {} > /dev/null || (echo '[{}]: BAD/MISSING Cfn Version Metadata'; exit 1)"
