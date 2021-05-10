# Terraform Module - Watchmaker Linux AutoScaling Group

This module utilizes the Terraform CloudFormation resource in conjunction
with an AWS CloudFormation template to deploy a Watchmaker Linux AutoScaling Group.

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AmiDistro"></a> [AmiDistro](#input\_AmiDistro) | (Required) Linux distro of the AMI | `string` | n/a | yes |
| <a name="input_AmiId"></a> [AmiId](#input\_AmiId) | (Required) ID of the AMI to launch | `string` | n/a | yes |
| <a name="input_KeyPairName"></a> [KeyPairName](#input\_KeyPairName) | (Required) Public/private key pairs allow you to securely connect to your instance after it launches | `string` | n/a | yes |
| <a name="input_Name"></a> [Name](#input\_Name) | (Required) Name of CloudFormation Stack | `string` | n/a | yes |
| <a name="input_SecurityGroupIds"></a> [SecurityGroupIds](#input\_SecurityGroupIds) | (Required) List of security groups to apply to the instance | `string` | n/a | yes |
| <a name="input_SubnetIds"></a> [SubnetIds](#input\_SubnetIds) | (Required) List of subnets to associate to the Autoscaling Group | `string` | n/a | yes |
| <a name="input_AppScriptParams"></a> [AppScriptParams](#input\_AppScriptParams) | (Optional) Parameter string to pass to the application script. Ignored if AppScriptUrl is blank | `string` | `""` | no |
| <a name="input_AppScriptShell"></a> [AppScriptShell](#input\_AppScriptShell) | (Optional) Shell with which to execute the application script. Ignored if AppScriptUrl is blank | `string` | `"bash"` | no |
| <a name="input_AppScriptUrl"></a> [AppScriptUrl](#input\_AppScriptUrl) | (Optional) S3 URL to the application script in an S3 bucket (s3://). Leave blank to launch without an application script. If specified, an appropriate InstanceRole is required | `string` | `null` | no |
| <a name="input_AppVolumeDevice"></a> [AppVolumeDevice](#input\_AppVolumeDevice) | (Optional) Decision whether to mount an extra EBS volume. Leave as default ("false") to launch without an extra application volume | `bool` | `false` | no |
| <a name="input_AppVolumeDeviceName"></a> [AppVolumeDeviceName](#input\_AppVolumeDeviceName) | (Optional) Device name to give to the extra EBS volume. Ignored if AppVolumeDevice is false | `string` | `"/dev/xvdf"` | no |
| <a name="input_AppVolumeEncrypted"></a> [AppVolumeEncrypted](#input\_AppVolumeEncrypted) | (Optional) Controls whether the EBS volume will be encrypted | `bool` | `false` | no |
| <a name="input_AppVolumeMountPath"></a> [AppVolumeMountPath](#input\_AppVolumeMountPath) | (Optional) Filesystem path to mount the extra app volume. Ignored if AppVolumeDevice is false | `string` | `"/opt/data"` | no |
| <a name="input_AppVolumeSize"></a> [AppVolumeSize](#input\_AppVolumeSize) | (Optional) Size in GB of the EBS volume to create. Ignored if AppVolumeDevice is false | `string` | `"1"` | no |
| <a name="input_AppVolumeSnapshotId"></a> [AppVolumeSnapshotId](#input\_AppVolumeSnapshotId) | (Optional) EBS Snapshot ID from which to create the AppVolume. "AppVolumeSize" must be equal or greater than the size of the snapshot. Ignored if "AppVolumeDevice" is false | `string` | `null` | no |
| <a name="input_AppVolumeType"></a> [AppVolumeType](#input\_AppVolumeType) | (Optional) Type of EBS volume to create. Ignored if AppVolumeDevice is false | `string` | `"gp2"` | no |
| <a name="input_AsgMetrics"></a> [AsgMetrics](#input\_AsgMetrics) | (Optional) The list of ASG metrics to collect. Must define EnableASGMetricsCollection to enable. Define MetricsCollectionGranularity and leave this option blank to collect all metrics | `list(string)` | `[]` | no |
| <a name="input_AsgNotificationTypes"></a> [AsgNotificationTypes](#input\_AsgNotificationTypes) | (Optional) A list of event types that trigger a notification. Event types can include any of the following types: autoscaling:EC2\_INSTANCE\_LAUNCH, autoscaling:EC2\_INSTANCE\_LAUNCH\_ERROR, autoscaling:EC2\_INSTANCE\_TERMINATE, autoscaling:EC2\_INSTANCE\_TERMINATE\_ERROR, and autoscaling:TEST\_NOTIFICATION. NOTE: Must be defined in conjunction with ASGSNSARN. | `list(string)` | `[]` | no |
| <a name="input_AsgSnsArn"></a> [AsgSnsArn](#input\_AsgSnsArn) | (Optional) The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to send ASG events to. NOTE: Must be defined in conjunction with ASGNotificationTypes. | `string` | `null` | no |
| <a name="input_Capabilities"></a> [Capabilities](#input\_Capabilities) | (Optional) A list of capabilities. Valid values: CAPABILITY\_IAM or CAPABILITY\_NAMED\_IAM | `list(string)` | `[]` | no |
| <a name="input_CfnEndpointUrl"></a> [CfnEndpointUrl](#input\_CfnEndpointUrl) | (Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com | `string` | `"https://cloudformation.us-east-1.amazonaws.com"` | no |
| <a name="input_CloudWatchAgentUrl"></a> [CloudWatchAgentUrl](#input\_CloudWatchAgentUrl) | (Optional) S3 URL to CloudWatch Agent installer. Example: s3://amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip | `string` | `null` | no |
| <a name="input_CloudWatchAppLogs"></a> [CloudWatchAppLogs](#input\_CloudWatchAppLogs) | (Optional) List of application log file paths to send to CloudWatch | `list(string)` | `[]` | no |
| <a name="input_DesiredCapacity"></a> [DesiredCapacity](#input\_DesiredCapacity) | (Optional) Desired number of instances in the Autoscaling Group | `string` | `"1"` | no |
| <a name="input_DisableRollback"></a> [DisableRollback](#input\_DisableRollback) | (Optional) Set to true to disable rollback of the stack if stack creation failed. Conflicts with OnFailure | `string` | `false` | no |
| <a name="input_EbsOptimized"></a> [EbsOptimized](#input\_EbsOptimized) | (Optional) Specifies whether the launch configuration is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. Warning: Stack creation will fail if set to true and the instance type does not support EBS Optimization. See complete list of supported instances here: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html#ebs-optimization-support | `bool` | `false` | no |
| <a name="input_EnableRepos"></a> [EnableRepos](#input\_EnableRepos) | (Optional) Specify repos to be enabled by yum-config-manager | `string` | `null` | no |
| <a name="input_IamRoleArn"></a> [IamRoleArn](#input\_IamRoleArn) | (Optional) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials | `string` | `null` | no |
| <a name="input_InstanceRole"></a> [InstanceRole](#input\_InstanceRole) | (Optional) IAM instance role to apply to the instance | `string` | `null` | no |
| <a name="input_InstanceTerminationPolicies"></a> [InstanceTerminationPolicies](#input\_InstanceTerminationPolicies) | (Optional) A list of policies that are used to select the instances to terminate. The policies are executed in the order that you list them. | `list(string)` | `[]` | no |
| <a name="input_InstanceType"></a> [InstanceType](#input\_InstanceType) | (Optional) Amazon EC2 instance type | `string` | `"t2.micro"` | no |
| <a name="input_LoadBalancerNames"></a> [LoadBalancerNames](#input\_LoadBalancerNames) | (Optional) Comma-separated string of Classic ELB Names to associate with the Autoscaling Group; conflicts with TargetGroupArns | `string` | `null` | no |
| <a name="input_MaxCapacity"></a> [MaxCapacity](#input\_MaxCapacity) | (Optional) Maximum number of instances in the Autoscaling Group | `string` | `"2"` | no |
| <a name="input_MinCapacity"></a> [MinCapacity](#input\_MinCapacity) | (Optional) Minimum number of instances in the Autoscaling Group | `string` | `"1"` | no |
| <a name="input_NoPublicIp"></a> [NoPublicIp](#input\_NoPublicIp) | (Optional) Controls whether to assign the instance a public IP. Recommended to leave at true _unless_ launching in a public subnet | `bool` | `true` | no |
| <a name="input_NoReboot"></a> [NoReboot](#input\_NoReboot) | (Optional) Controls whether to reboot the instance as the last step of cfn-init execution | `bool` | `false` | no |
| <a name="input_NoUpdates"></a> [NoUpdates](#input\_NoUpdates) | (Optional) Controls whether to run yum update during a stack update (On the initial instance launch, Watchmaker _always_ installs updates) | `bool` | `false` | no |
| <a name="input_NotificationArns"></a> [NotificationArns](#input\_NotificationArns) | (Optional) A list of SNS topic ARNs to publish stack related events | `list(string)` | `[]` | no |
| <a name="input_OnFailureAction"></a> [OnFailureAction](#input\_OnFailureAction) | (Optional) Action to be taken if stack creation fails. This must be one of: DO\_NOTHING, ROLLBACK, or DELETE. Conflicts with DisableRollback | `string` | `"DO_NOTHING"` | no |
| <a name="input_PatchGroup"></a> [PatchGroup](#input\_PatchGroup) | (Optional) Key value of the Patch Group tag. Controls whether to create a PatchGroup tag that can be leveraged via SSM to auto-update instances. | `string` | `null` | no |
| <a name="input_PolicyBody"></a> [PolicyBody](#input\_PolicyBody) | (Optional) String containing the stack policy body. Conflicts with PolicyUrl | `string` | `null` | no |
| <a name="input_PolicyUrl"></a> [PolicyUrl](#input\_PolicyUrl) | (Optional) URL to a file containing the stack policy. Conflicts with PolicyBody | `string` | `null` | no |
| <a name="input_PypiIndexUrl"></a> [PypiIndexUrl](#input\_PypiIndexUrl) | (Optional) URL to the PyPi Index | `string` | `"https://pypi.org/simple"` | no |
| <a name="input_RootVolumeEncrypted"></a> [RootVolumeEncrypted](#input\_RootVolumeEncrypted) | (Optional) Controls whether the root volume will be encrypted | `bool` | `false` | no |
| <a name="input_RootVolumeSize"></a> [RootVolumeSize](#input\_RootVolumeSize) | (Optional) Root Volume Size in GB **NOTE** This value can be set larger than the default (20GB) but NOT smaller. If set larger than default value partition will need to be expanded manually. | `string` | `"20"` | no |
| <a name="input_ScaleDownSchedule"></a> [ScaleDownSchedule](#input\_ScaleDownSchedule) | (Optional) Scheduled Action in cron-format (UTC) to scale down to MinCapacity; ignored if empty or ScaleUpSchedule is unset (E.g. "0 0 * * *") | `string` | `null` | no |
| <a name="input_ScaleUpSchedule"></a> [ScaleUpSchedule](#input\_ScaleUpSchedule) | (Optional) Scheduled Action in cron-format (UTC) to scale up to MaxCapacity; ignored if empty or ScaleDownSchedule is unset (E.g. "0 10 * * Mon-Fri") | `string` | `null` | no |
| <a name="input_StackTags"></a> [StackTags](#input\_StackTags) | (Optional) A map of tag keys/values to associate with this stack | `map(string)` | `{}` | no |
| <a name="input_TargetGroupArns"></a> [TargetGroupArns](#input\_TargetGroupArns) | (Optional) Comma-separated string of Target Group ARNs to associate with the Autoscaling Group; conflicts with LoadBalancerNames | `string` | `null` | no |
| <a name="input_TimeoutInMinutes"></a> [TimeoutInMinutes](#input\_TimeoutInMinutes) | (Optional) The amount of time that can pass before the stack status becomes CREATE\_FAILED | `string` | `"30"` | no |
| <a name="input_ToggleCfnInitUpdate"></a> [ToggleCfnInitUpdate](#input\_ToggleCfnInitUpdate) | (Optional) A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence | `string` | `"A"` | no |
| <a name="input_ToggleNewInstances"></a> [ToggleNewInstances](#input\_ToggleNewInstances) | (Optional) A/B toggle that forces a change to instance userdata, triggering new instances via the Autoscale update policy | `string` | `"A"` | no |
| <a name="input_WatchmakerAdminGroups"></a> [WatchmakerAdminGroups](#input\_WatchmakerAdminGroups) | (Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance | `string` | `null` | no |
| <a name="input_WatchmakerAdminUsers"></a> [WatchmakerAdminUsers](#input\_WatchmakerAdminUsers) | (Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance | `string` | `null` | no |
| <a name="input_WatchmakerConfig"></a> [WatchmakerConfig](#input\_WatchmakerConfig) | (Optional) URL to a Watchmaker config file | `string` | `null` | no |
| <a name="input_WatchmakerEnvironment"></a> [WatchmakerEnvironment](#input\_WatchmakerEnvironment) | (Optional) Environment in which the instance is being deployed | `string` | `null` | no |
| <a name="input_WatchmakerExtraArgs"></a> [WatchmakerExtraArgs](#input\_WatchmakerExtraArgs) | (Optional) Additional parameters to be passed to the Watchmaker CLI | `string` | `null` | no |
| <a name="input_WatchmakerOuPath"></a> [WatchmakerOuPath](#input\_WatchmakerOuPath) | (Optional) DN of the OU to place the instance when joining a domain. If blank and WatchmakerEnvironment enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if WatchmakerEnvironment is false | `string` | `null` | no |
| <a name="input_WatchmakerStandaloneUrl"></a> [WatchmakerStandaloneUrl](#input\_WatchmakerStandaloneUrl) | (Optional) HTTP/S URL to a Watchmaker standalone executable. The file will be retrieved and used to run Watchmaker, instead of installing Watchmaker from PyPi | `string` | `null` | no |
| <a name="input_WatchmakerVersion"></a> [WatchmakerVersion](#input\_WatchmakerVersion) | (Optional) Watchmaker version to install. When blank (the default) the latest version will be installed. Used only when Watchmaker is installed from PyPi | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_watchmaker-lx-autoscale"></a> [watchmaker-lx-autoscale](#output\_watchmaker-lx-autoscale) | CloudFormation stack object for watchmaker-lx-autoscale |

<!-- END TFDOCS -->
