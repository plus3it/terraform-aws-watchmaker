
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

* [Root](https://github.com/eemperor/terraform-aws-watchmaker/tree/master): This folder shows an example of Terraform code that uses the [Linux Instance module](https://github.com/eemperor/terraform-aws-watchmaker/tree/master/modules/lx-instance) to deploy a Watchmaker Linux instance.
* [Modules](https://github.com/eemperor/terraform-aws-watchmaker/tree/master/modules): This folder contains the individual modules with reusable code for the desired type of deployment.
* [Examples](https://github.com/eemperor/terraform-aws-watchmaker/tree/master/examples): This folder contains examples of how to use the modules.

To use this module, download this repository and modify the ```main.tf``` in the root directory to your desired
configuration.
