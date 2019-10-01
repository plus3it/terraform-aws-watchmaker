# Terraform Module - Watchmaker Windows Instance

This module utilizes the Terraform CloudFormation resource in conjunction
with an AWS CloudFormation template to deploy a Watchmaker Windows Instance.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| AmiDistro | (Required) Linux distro of the AMI | string | n/a | yes |
| AmiId | (Required) ID of the AMI to launch | string | n/a | yes |
| AppScriptParams | (Optional) Parameter string to pass to the application script. Ignored if AppScriptUrl is blank | string | `"null"` | no |
| AppScriptShell | (Optional) Shell with which to execute the application script. Ignored if AppScriptUrl is blank | string | `"bash"` | no |
| AppScriptUrl | (Optional) S3 URL to the application script in an S3 bucket (s3://). Leave blank to launch without an application script. If specified, an appropriate InstanceRole is required | string | `"null"` | no |
| AppVolumeDevice | (Optional) Device to mount an extra EBS volume. Leave blank to launch without an extra application volume | string | `"null"` | no |
| AppVolumeMountPath | (Optional) Filesystem path to mount the extra app volume. Ignored if AppVolumeDevice is blank | string | `"/opt/data"` | no |
| AppVolumeSize | (Optional) Size in GB of the EBS volume to create. Ignored if AppVolumeDevice is blank | string | `"1"` | no |
| AppVolumeType | (Optional) Type of EBS volume to create. Ignored if AppVolumeDevice is blank | string | `"gp2"` | no |
| CfnEndpointUrl | (Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com | string | `"https://cloudformation.us-east-1.amazonaws.com"` | no |
| CfnGetPipUrl | (Optional) URL to get-pip.py | string | `"https://bootstrap.pypa.io/2.6/get-pip.py"` | no |
| EnableRepos | (Optional) Specify repos to be enabled by yum-config-manager | string | `"null"` | no |
| InstanceRole | (Optional) IAM instance role to apply to the instance | string | `"null"` | no |
| InstanceType | (Optional) Amazon EC2 instance type | string | `"t2.micro"` | no |
| KeyPairName | (Required) Public/private key pairs allow you to securely connect to your instance after it launches | string | n/a | yes |
| Name | (Required) Name of CloudFormation Stack | string | n/a | yes |
| NoPublicIp | (Optional) Controls whether to assign the instance a public IP. Recommended to leave at true _unless_ launching in a public subnet | bool | `"true"` | no |
| NoReboot | (Optional) Controls whether to reboot the instance as the last step of cfn-init execution | bool | `"false"` | no |
| NoUpdates | (Optional) Controls whether to run yum update during a stack update (On the initial instance launch, Watchmaker _always_ installs updates) | bool | `"false"` | no |
| PrivateIp | (Optional) Set a static, primary private IP. Leave blank to auto-select a free IP | string | `"null"` | no |
| PypiIndexUrl | (Optional) URL to the PyPi Index | string | `"https://pypi.org/simple"` | no |
| SecurityGroupIds | (Required) List of security groups to apply to the instance | string | n/a | yes |
| SubnetId | (Required) ID of the subnet to assign to the instance | string | n/a | yes |
| ToggleCfnInitUpdate | (Optional) A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence | string | `"A"` | no |
| WatchmakerAdminGroups | (Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance | string | `"null"` | no |
| WatchmakerAdminUsers | (Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance | string | `"null"` | no |
| WatchmakerComputerName | (Optional) Sets the hostname/computername within the OS | string | `"null"` | no |
| WatchmakerConfig | (Optional) URL to a Watchmaker config file | string | `"null"` | no |
| WatchmakerEnvironment | (Optional) Environment in which the instance is being deployed | string | `"null"` | no |
| WatchmakerOuPath | (Optional) DN of the OU to place the instance when joining a domain. If blank and WatchmakerEnvironment enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if WatchmakerEnvironment is false | string | `"null"` | no |
| WatchmakerS3Source | (Optional) Flag that tells watchmaker to use its instance role to retrieve watchmaker content from S3 | bool | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| watchmaker-lx-instance-stack | CloudFormation stack object for watchmaker-lx-instance-stack |

