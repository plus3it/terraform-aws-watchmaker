# Terraform Module - Watchmaker Windows Instance

This module utilizes the Terraform CloudFormation resource in conjunction
with an AWS CloudFormation template to deploy a Watchmaker Windows Instance.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| AmiId | \(Required\) ID of the AMI to launch | string | n/a | yes |
| AppScriptParams | \(Optional\) Parameter string to pass to the application script. Ignored if AppScriptUrl is blank | string | `""` | no |
| AppScriptUrl | \(Optional\) S3 URL to the .ps1 or .bat application script in an S3 bucket \(s3://\). Leave blank to launch without an application script. If specified, an appropriate InstanceRole is required | string | `"null"` | no |
| AppVolumeDevice | #\(Optional\) Device to mount an extra EBS volume. Leave blank to launch without an extra application volume | string | `"null"` | no |
| AppVolumeSize | \(Optional\) Size in GB of the EBS volume to create. Ignored if AppVolumeDevice is blank | string | `"1"` | no |
| AppVolumeSnapshotId | \(Optional\) EBS Snapshot ID from which to create the AppVolume. "AppVolumeSize" must be equal or greater than the size of the snapshot. Ignored if "AppVolumeDevice" is blank | string | `"null"` | no |
| AppVolumeType | \(Optional\) Type of EBS volume to create. Ignored if AppVolumeDevice is blank | string | `"gp2"` | no |
| Capabilities | \(Optional\) A list of capabilities. Valid values: CAPABILITY\_IAM or CAPABILITY\_NAMED\_IAM | list(string) | `<list>` | no |
| CfnEndpointUrl | \(Optional\) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com | string | `"https://cloudformation.us-east-1.amazonaws.com"` | no |
| CloudWatchAgentUrl | \(Optional\) S3 URL to CloudWatch Agent installer. Example: s3://amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi | string | `"null"` | no |
| CloudWatchAppLogs | \(Optional\) List of application log file paths to send to CloudWatch. Example: C:\dir1\file1,C:\dir2\file2,C:\dir3\file3 | list(string) | `<list>` | no |
| DisableApiTermination | \(Optional\) Specifies whether the instance can be terminated through the API. | bool | `"false"` | no |
| DisableRollback | \(Optional\) Set to true to disable rollback of the stack if stack creation failed. Conflicts with OnFailure | string | `"false"` | no |
| EbsOptimized | \(Optional\) Specifies whether the instance is optimized for Amazon Elastic Block Store I/O. Warning: Stack creation will fail if set to true and the instance type does not support EBS Optimization. See complete list of supported instances here: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html#ebs-optimization-support | bool | `"false"` | no |
| IamRoleArn | \(Optional\) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials | string | `"null"` | no |
| InstanceRole | \(Optional\) IAM instance role to apply to the instance | string | `"null"` | no |
| InstanceType | \(Optional\) Amazon EC2 instance type | string | `"t2.micro"` | no |
| KeyPairName | \(Required\) Public/private key pairs allow you to securely connect to your instance after it launches | string | n/a | yes |
| Name | \(Required\) Name of CloudFormation Stack | string | n/a | yes |
| NoPublicIp | \(Optional\) Controls whether to assign the instance a public IP. Recommended to leave at true \_unless\_ launching in a public subnet | bool | `"true"` | no |
| NoReboot | \(Optional\) Controls whether to reboot the instance as the last step of cfn-init execution | bool | `"false"` | no |
| NotificationArns | \(Optional\) A list of SNS topic ARNs to publish stack related events | list(string) | `<list>` | no |
| OnFailureAction | \(Optional\) Action to be taken if stack creation fails. This must be one of: DO\_NOTHING, ROLLBACK, or DELETE. Conflicts with DisableRollback | string | `"DO_NOTHING"` | no |
| PatchGroup | \(Optional\) Key value of the Patch Group tag. Controls whether to create a PatchGroup tag that can be leveraged via SSM to auto-update instances. | string | `"null"` | no |
| PolicyBody | \(Optional\) String containing the stack policy body. Conflicts with PolicyUrl | string | `"null"` | no |
| PolicyUrl | \(Optional\) URL to a file containing the stack policy. Conflicts with PolicyBody | string | `"null"` | no |
| PrivateIp | \(Optional\) Set a static, primary private IP. Leave blank to auto-select a free IP | string | `"null"` | no |
| PypiIndexUrl | \(Optional\) URL to the PyPi Index | string | `"https://pypi.org/simple"` | no |
| PythonInstaller | \(Optional\) URL to the Python Installer Executable | string | `"https://www.python.org/ftp/python/3.6.4/python-3.6.4-amd64.exe"` | no |
| RootVolumeSize | \(Optional\) Root Volume Size in GB \*\*NOTE\*\* This value can be set larger than the default \(30GB\) but NOT smaller. | string | `"30"` | no |
| SecurityGroupIds | \(Required\) List of security groups to apply to the instance | string | n/a | yes |
| StackTags | \(Optional\) A map of tag keys/values to associate with this stack | map(string) | `<map>` | no |
| SubnetId | \(Required\) ID of the subnet to assign to the instance | string | n/a | yes |
| TimeoutInMinutes | \(Optional\) The amount of time that can pass before the stack status becomes CREATE\_FAILED | string | `"30"` | no |
| ToggleCfnInitUpdate | \(Optional\) A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence | string | `"A"` | no |
| WatchmakerAdminGroups | \(Optional\) Colon-separated list of domain groups that should have admin permissions on the EC2 instance | string | `"null"` | no |
| WatchmakerAdminUsers | \(Optional\) Colon-separated list of domain users that should have admin permissions on the EC2 instance | string | `"null"` | no |
| WatchmakerBootstrapper | \(Optional\) URL to the Watchmaker PowerShell bootstrapper for Windows | string | `"https://raw.githubusercontent.com/plus3it/watchmaker/master/docs/files/bootstrap/watchmaker-bootstrap.ps1"` | no |
| WatchmakerComputerName | \(Optional\) Sets the hostname/computername within the OS | string | `"null"` | no |
| WatchmakerConfig | \(Optional\) URL to a Watchmaker config file | string | `"null"` | no |
| WatchmakerEnvironment | \(Optional\) Environment in which the instance is being deployed | string | `"null"` | no |
| WatchmakerExtraArgs | \(Optional\) Additional parameters to be passed to the Watchmaker CLI | string | `"null"` | no |
| WatchmakerOuPath | \(Optional\) DN of the OU to place the instance when joining a domain. If blank and WatchmakerEnvironment enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if WatchmakerEnvironment is false | string | `"null"` | no |
| WatchmakerStandaloneUrl | \(Optional\) HTTP/S URL to a Watchmaker standalone executable. The file will be retrieved and used to run Watchmaker, instead of installing Watchmaker from PyPi | string | `"null"` | no |
| WatchmakerVersion | \(Optional\) Watchmaker version to install. When blank \(the default\) the latest version will be installed. Used only when Watchmaker is installed from PyPi | string | `"null"` | no |

## Outputs

| Name | Description |
|------|-------------|
| watchmaker-win-instance | CloudFormation stack object for watchmaker-win-instance |

