# Terraform Module - Watchmaker Linux Instance

This module utilizes the Terraform CloudFormation resource in conjunction
with an AWS CloudFormation template to deploy a Watchmaker Linux Instance.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| AmiDistro | \(Required\) Linux distro of the AMI | string | n/a | yes |
| AmiId | \(Required\) ID of the AMI to launch | string | n/a | yes |
| AppScriptParams | \(Optional\) Parameter string to pass to the application script. Ignored if AppScriptUrl is blank | string | `""` | no |
| AppScriptShell | \(Optional\) Shell with which to execute the application script. Ignored if AppScriptUrl is blank | string | `"bash"` | no |
| AppScriptUrl | \(Optional\) S3 URL to the application script in an S3 bucket \(s3://\). Leave blank to launch without an application script. If specified, an appropriate InstanceRole is required | string | `"null"` | no |
| AppVolumeDevice | \(Optional\) Decision whether to mount an extra EBS volume. Leave as default \(false\) to launch without an extra application volume | bool | `"false"` | no |
| AppVolumeMountPath | \(Optional\) Filesystem path to mount the extra app volume. Ignored if AppVolumeDevice is false | string | `"/opt/data"` | no |
| AppVolumeSize | \(Optional\) Size in GB of the EBS volume to create. Ignored if AppVolumeDevice is false | string | `"1"` | no |
| AppVolumeSnapshotId | \(Optional\) EBS Snapshot ID from which to create the AppVolume. "AppVolumeSize" must be equal or greater than the size of the snapshot. Ignored if "AppVolumeDevice" is false | string | `"null"` | no |
| AppVolumeType | \(Optional\) Type of EBS volume to create. Ignored if AppVolumeDevice is false | string | `"gp2"` | no |
| Capabilities | \(Optional\) A list of capabilities. Valid values: CAPABILITY\_IAM or CAPABILITY\_NAMED\_IAM | list(string) | `<list>` | no |
| CfnEndpointUrl | \(Optional\) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com | string | `"https://cloudformation.us-east-1.amazonaws.com"` | no |
| CloudWatchAgentUrl | \(Optional\) S3 URL to CloudWatch Agent installer. Example: s3://amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip | string | `"null"` | no |
| CloudWatchAppLogs | \(Optional\) List of application log file paths to send to CloudWatch | list(string) | `<list>` | no |
| DisableApiTermination | \(Optional\) Specifies whether the instance can be terminated through the API. | bool | `"false"` | no |
| DisableRollback | \(Optional\) Set to true to disable rollback of the stack if stack creation failed. Conflicts with OnFailure | string | `"false"` | no |
| EbsOptimized | \(Optional\) Specifies whether the instance is optimized for Amazon Elastic Block Store I/O. See complete list of supported instances here: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html#ebs-optimization-support | bool | `"false"` | no |
| EnableRepos | \(Optional\) Specify repos to be enabled by yum-config-manager | string | `"null"` | no |
| IamRoleArn | \(Optional\) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials | string | `"null"` | no |
| InstanceRole | \(Optional\) IAM instance role to apply to the instance | string | `"null"` | no |
| InstanceType | \(Optional\) Amazon EC2 instance type | string | `"t2.micro"` | no |
| KeyPairName | \(Required\) Public/private key pairs allow you to securely connect to your instance after it launches | string | n/a | yes |
| Name | \(Required\) Name of CloudFormation Stack | string | n/a | yes |
| NoPublicIp | \(Optional\) Controls whether to assign the instance a public IP. Recommended to leave at true \_unless\_ launching in a public subnet | bool | `"true"` | no |
| NoReboot | \(Optional\) Controls whether to reboot the instance as the last step of cfn-init execution | bool | `"false"` | no |
| NoUpdates | \(Optional\) Controls whether to run yum update during a stack update \(On the initial instance launch, Watchmaker \_always\_ installs updates\) | bool | `"false"` | no |
| NotificationArns | \(Optional\) A list of SNS topic ARNs to publish stack related events | list(string) | `<list>` | no |
| OnFailureAction | \(Optional\) Action to be taken if stack creation fails. This must be one of: DO\_NOTHING, ROLLBACK, or DELETE. Conflicts with DisableRollback | string | `"DO_NOTHING"` | no |
| PatchGroup | \(Optional\) Key value of the Patch Group tag. Controls whether to create a PatchGroup tag that can be leveraged via SSM to auto-update instances. | string | `"null"` | no |
| PolicyBody | \(Optional\) String containing the stack policy body. Conflicts with PolicyUrl | string | `"null"` | no |
| PolicyUrl | \(Optional\) URL to a file containing the stack policy. Conflicts with PolicyBody | string | `"null"` | no |
| PrivateIp | \(Optional\) Set a static, primary private IP. Leave blank to auto-select a free IP | string | `"null"` | no |
| PypiIndexUrl | \(Optional\) URL to the PyPi Index | string | `"https://pypi.org/simple"` | no |
| RootVolumeSize | \(Optional\) Root Volume Size in GB \*\*NOTE\*\* This value can be set larger than the default \(20GB\) but NOT smaller. If set larger than default value partition will need to be expanded manually. | string | `"20"` | no |
| SecurityGroupIds | \(Required\) List of security groups to apply to the instance | string | n/a | yes |
| StackTags | \(Optional\) A map of tag keys/values to associate with this stack | map(string) | `<map>` | no |
| SubnetId | \(Required\) ID of the subnet to assign to the instance | string | n/a | yes |
| TimeoutInMinutes | \(Optional\) The amount of time that can pass before the stack status becomes CREATE\_FAILED | string | `"30"` | no |
| ToggleCfnInitUpdate | \(Optional\) A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence | string | `"A"` | no |
| WatchmakerAdminGroups | \(Optional\) Colon-separated list of domain groups that should have admin permissions on the EC2 instance | string | `"null"` | no |
| WatchmakerAdminUsers | \(Optional\) Colon-separated list of domain users that should have admin permissions on the EC2 instance | string | `"null"` | no |
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
| watchmaker-lx-instance | CloudFormation stack object for watchmaker-lx-instance |

