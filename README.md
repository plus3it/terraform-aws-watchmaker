
[![License](https://img.shields.io/github/license/plus3it/terraform-aws-watchmaker.svg)](./LICENSE)
[![pullreminders](https://pullreminders.com/badge.svg)](https://pullreminders.com?ref=badge)

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

To use this module, create a Terraform file with the same format as ```main.tf``` in the root or example directories with variables set to your desired configuration.

In your Terraform working directory, run the following commands:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

No providers.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AmiDistro"></a> [AmiDistro](#input\_AmiDistro) | (Required) Linux distro of the AMI | `string` | n/a | yes |
| <a name="input_AmiId"></a> [AmiId](#input\_AmiId) | (Required) ID of the AMI to launch | `string` | n/a | yes |
| <a name="input_KeyPairName"></a> [KeyPairName](#input\_KeyPairName) | (Required) Public/private key pairs allow you to securely connect to your instance after it launches | `string` | n/a | yes |
| <a name="input_Name"></a> [Name](#input\_Name) | (Required) Name of CloudFormation Stack | `string` | n/a | yes |
| <a name="input_SecurityGroupIds"></a> [SecurityGroupIds](#input\_SecurityGroupIds) | (Required) List of security groups to apply to the instance | `string` | n/a | yes |
| <a name="input_SubnetId"></a> [SubnetId](#input\_SubnetId) | (Required) ID of the subnet to assign to the instance | `string` | n/a | yes |
| <a name="input_AppScriptParams"></a> [AppScriptParams](#input\_AppScriptParams) | (Optional) Parameter string to pass to the application script. Ignored if AppScriptUrl is blank | `string` | `null` | no |
| <a name="input_AppScriptShell"></a> [AppScriptShell](#input\_AppScriptShell) | (Optional) Shell with which to execute the application script. Ignored if AppScriptUrl is blank | `string` | `"bash"` | no |
| <a name="input_AppScriptUrl"></a> [AppScriptUrl](#input\_AppScriptUrl) | (Optional) S3 URL to the application script in an S3 bucket (s3://). Leave blank to launch without an application script. If specified, an appropriate InstanceRole is required | `string` | `null` | no |
| <a name="input_AppVolumeDevice"></a> [AppVolumeDevice](#input\_AppVolumeDevice) | (Optional) Device to mount an extra EBS volume. Leave blank to launch without an extra application volume | `string` | `null` | no |
| <a name="input_AppVolumeMountPath"></a> [AppVolumeMountPath](#input\_AppVolumeMountPath) | (Optional) Filesystem path to mount the extra app volume. Ignored if AppVolumeDevice is blank | `string` | `"/opt/data"` | no |
| <a name="input_AppVolumeSize"></a> [AppVolumeSize](#input\_AppVolumeSize) | (Optional) Size in GB of the EBS volume to create. Ignored if AppVolumeDevice is blank | `string` | `"1"` | no |
| <a name="input_AppVolumeType"></a> [AppVolumeType](#input\_AppVolumeType) | (Optional) Type of EBS volume to create. Ignored if AppVolumeDevice is blank | `string` | `"gp2"` | no |
| <a name="input_CfnEndpointUrl"></a> [CfnEndpointUrl](#input\_CfnEndpointUrl) | (Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com | `string` | `"https://cloudformation.us-east-1.amazonaws.com"` | no |
| <a name="input_CfnGetPipUrl"></a> [CfnGetPipUrl](#input\_CfnGetPipUrl) | (Optional) URL to get-pip.py | `string` | `"https://bootstrap.pypa.io/2.6/get-pip.py"` | no |
| <a name="input_EnableRepos"></a> [EnableRepos](#input\_EnableRepos) | (Optional) Specify repos to be enabled by yum-config-manager | `string` | `null` | no |
| <a name="input_InstanceRole"></a> [InstanceRole](#input\_InstanceRole) | (Optional) IAM instance role to apply to the instance | `string` | `null` | no |
| <a name="input_InstanceType"></a> [InstanceType](#input\_InstanceType) | (Optional) Amazon EC2 instance type | `string` | `"t2.micro"` | no |
| <a name="input_NoPublicIp"></a> [NoPublicIp](#input\_NoPublicIp) | (Optional) Controls whether to assign the instance a public IP. Recommended to leave at true _unless_ launching in a public subnet | `bool` | `true` | no |
| <a name="input_NoReboot"></a> [NoReboot](#input\_NoReboot) | (Optional) Controls whether to reboot the instance as the last step of cfn-init execution | `bool` | `false` | no |
| <a name="input_NoUpdates"></a> [NoUpdates](#input\_NoUpdates) | (Optional) Controls whether to run yum update during a stack update (On the initial instance launch, Watchmaker _always_ installs updates) | `bool` | `false` | no |
| <a name="input_PrivateIp"></a> [PrivateIp](#input\_PrivateIp) | (Optional) Set a static, primary private IP. Leave blank to auto-select a free IP | `string` | `null` | no |
| <a name="input_PypiIndexUrl"></a> [PypiIndexUrl](#input\_PypiIndexUrl) | (Optional) URL to the PyPi Index | `string` | `"https://pypi.org/simple"` | no |
| <a name="input_ToggleCfnInitUpdate"></a> [ToggleCfnInitUpdate](#input\_ToggleCfnInitUpdate) | (Optional) A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence | `string` | `"A"` | no |
| <a name="input_WatchmakerAdminGroups"></a> [WatchmakerAdminGroups](#input\_WatchmakerAdminGroups) | (Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance | `string` | `null` | no |
| <a name="input_WatchmakerAdminUsers"></a> [WatchmakerAdminUsers](#input\_WatchmakerAdminUsers) | (Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance | `string` | `null` | no |
| <a name="input_WatchmakerComputerName"></a> [WatchmakerComputerName](#input\_WatchmakerComputerName) | (Optional) Sets the hostname/computername within the OS | `string` | `null` | no |
| <a name="input_WatchmakerConfig"></a> [WatchmakerConfig](#input\_WatchmakerConfig) | (Optional) URL to a Watchmaker config file | `string` | `null` | no |
| <a name="input_WatchmakerEnvironment"></a> [WatchmakerEnvironment](#input\_WatchmakerEnvironment) | (Optional) Environment in which the instance is being deployed | `string` | `null` | no |
| <a name="input_WatchmakerOuPath"></a> [WatchmakerOuPath](#input\_WatchmakerOuPath) | (Optional) DN of the OU to place the instance when joining a domain. If blank and WatchmakerEnvironment enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if WatchmakerEnvironment is false | `string` | `null` | no |
| <a name="input_WatchmakerS3Source"></a> [WatchmakerS3Source](#input\_WatchmakerS3Source) | (Optional) Flag that tells watchmaker to use its instance role to retrieve watchmaker content from S3 | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_watchmaker-lx-instance-stack"></a> [watchmaker-lx-instance-stack](#output\_watchmaker-lx-instance-stack) | CloudFormation stack object for watchmaker-lx-instance-stack |

<!-- END TFDOCS -->
