
[![License](https://img.shields.io/github/license/plus3it/watchmaker.svg)](./LICENSE)

# Watchmaker AWS Terraform Module

## terraform-aws-watchmaker

## Overview

This repo contains a set of Terraform modules that utilizes the Cloudformation Stack data
source to deploy AWS instances (Linux or Windows) configured with Watchmaker.  The resources
can be deployed as individual instances or in an AutoScaling Group.

For more information on installing and using Watchmaker, go to <https://watchmaker.readthedocs.io>.

## How To Use This module

This repo is structured as follows:

* [Root](https://github.com/eemperor/terraform-aws-watchmaker/tree/master): This folder contains an example of Terraform code that uses the [Linux Instance module](https://github.com/eemperor/terraform-aws-watchmaker/tree/master/modules/lx-instance) to deploy a Watchmaker Linux instance.
* [Modules](https://github.com/eemperor/terraform-aws-watchmaker/tree/master/modules): This folder contains the Terrafrom modules that are used to create the Watchmaker resources.
* [Examples](https://github.com/eemperor/terraform-aws-watchmaker/tree/master/examples): This folder contains working examples of how to use the modules.  Users will need to modify the parameters for their specific AWS environment.

To use this module, users can download this repository and modify the ```main.tf``` in the root directory to match their desired configuration.  Ensure that the source is pointing to the appropriate module folder.
