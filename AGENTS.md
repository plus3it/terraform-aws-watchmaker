# Agent Instructions

Before starting any task in this repository:

1. Run `make agents/sync`. It writes the shared Plus3 IT instructions for this repository's tardigrade-ci version to `.agents/plus3it/AGENTS.md`.
2. Read `.agents/plus3it/AGENTS.md` and follow it together with this file. If the sync fails, tell the user, and don't guess the conventions.

These rules always apply, even without the shared instructions:

- Don't push, open pull requests, publish releases, or apply infrastructure changes unless the user asks. List those steps for a person in your final report.
- Don't edit files under `.agents/plus3it/`; they are generated and overwritten by the sync.

@.agents/plus3it/AGENTS.md

## Repository-specific

### Purpose

This Terraform module repository holds four submodules that each deploy a Watchmaker-configured AWS instance, either as one instance or in an Auto Scaling group, for Linux or Windows. Each submodule creates one `aws_cloudformation_stack` from a CloudFormation template stored in the same directory. The required inputs include `Name` and `AmiId`; the other settings are passed to the template as stack parameters. The root module only wraps `modules/lx-instance` and outputs `watchmaker-lx-instance-stack`. Each submodule outputs its stack object, such as `watchmaker-lx-instance`.

### Module-specific files

- `modules/lx-instance/` — Creates a CloudFormation stack from `watchmaker-lx-instance.template.cfn.yaml` for a Linux instance; the root module calls it through its GitHub URL, not a local path
- `modules/lx-autoscale/` — Creates a CloudFormation stack from `watchmaker-lx-autoscale.template.cfn.yaml` for a Linux Auto Scaling group; the root module does not call it
- `modules/win-instance/` — Creates a CloudFormation stack from `watchmaker-win-instance.template.cfn.yaml` for a Windows instance; the root module does not call it
- `modules/win-autoscale/` — Creates a CloudFormation stack from `watchmaker-win-autoscale.template.cfn.yaml` for a Windows Auto Scaling group; the root module does not call it
- `modules/*/*.params.cfn.yaml` — Parameter files with `__PLACEHOLDER__` values for each template; no file in this repository references them
- `examples/` — One example per submodule (`lx-instance`, `lx-autoscale`, `win-instance`, `win-autoscale`); each calls its submodule through the GitHub URL, not a local path
- `tests/` — Terraform configuration that calls all four submodules from local paths (`../modules/...`), with two variants of each (CentOS 7 and Oracle 8 for Linux, 2016 and 2019 for Windows); `buildspec.yml` runs it
- `buildspec.yml` — AWS CodeBuild spec that installs Terraform in `tests/`, then runs `terraform init`, `plan`, and `apply`, and runs `terraform destroy` only if `DESTROY_AFTER_TEST` is `true`; no workflow in this repository calls it
- `.gitlab-ci.yml` — GitLab CI file with one `lint` job that runs `make cfn/lint`; it installs cfn-lint from `_requirements/cfn-lint.txt`, which does not exist in this repository
- `Dockerfile` — Image based on tardigrade-ci that sets the working directory to `/ci-harness` and `make` as the entrypoint. The tardigrade-ci `docker/run` target, which the shared lint workflow calls, builds this image when it is not already present.

### Deviations from the terraform-module profile

- The CloudFormation templates are the main code. Each submodule's `*.template.cfn.yaml` carries a version at `Metadata.Version`, and `.bumpversion.cfg` lists all four templates as files to update. The shared lint runs `cfn-lint` on every `*.template.cfn.*` file through the tardigrade-ci `cfn/lint` target, which is part of its `lint` target.
- The Makefile adds `BIN_DIR` and a `PATH` change, and sets `VERSION` from `current_version` in `.bumpversion.cfg`. It also adds the target `cfn/version`, which uses `yq` to check that every `*.template.cfn.*` file has a `Metadata.Version` that matches `VERSION`, and fails if one does not. The Makefile downloads the tardigrade-ci bootstrap file with `curl` on every run, instead of only when the file is missing.
- `.github/workflows/cfn.yml` ("CFN Version Validation") runs on pull requests and when called by another workflow. It reads `current_version` from `.bumpversion.cfg` and runs `make cfn/version VERSION=<that value>`. `.github/workflows/release.yml` calls it as the `precheck` job, and the release job needs it to pass.
- `.github/workflows/release.yml` runs on manual dispatch and on a push to `main` or `master` that changes `.bumpversion.cfg`, then calls the shared release workflow.
- There is no `CHANGELOG.md`, so skip the changelog step. For a release, run the `make bumpversion/*` target that fits the change. It changes `current_version` and the `Version:` line in the four templates together. `.bumpversion.cfg` has `commit = True` and `tag = False`, so it makes a commit and does not make a tag. Do not edit the template versions by hand; `cfn/version` fails if they differ from `.bumpversion.cfg`.
- The shared release workflow creates a GitHub Release, and its tag, named after `current_version` when it differs from the latest git tag.
