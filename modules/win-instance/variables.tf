# ------------------------------------------------------------------------------------------------------------------------
# This file contains variables associated with the Windows instance Terraform module.
# ------------------------------------------------------------------------------------------------------------------------

variable "Name" {
  type        = string
  description = "(Required) Name of CloudFormation Stack"
}

variable "Capabilities" {
  type        = list(string)
  description = "(Optional) A list of capabilities. Valid values: CAPABILITY_IAM or CAPABILITY_NAMED_IAM"
  default     = []
}

variable "DisableRollback" {
  type        = string
  description = "(Optional) Set to true to disable rollback of the stack if stack creation failed. Conflicts with OnFailure"
  default     = false
}

variable "IamRoleArn" {
  type        = string
  description = "(Optional) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials"
  default     = null
}

variable "NotificationArns" {
  type        = list(string)
  description = "(Optional) A list of SNS topic ARNs to publish stack related events"
  default     = []
}

variable "OnFailureAction" {
  type        = string
  description = "(Optional) Action to be taken if stack creation fails. This must be one of: DO_NOTHING, ROLLBACK, or DELETE. Conflicts with DisableRollback"
  default     = "DO_NOTHING"
}

variable "PatchGroup" {
  type        = string
  description = "(Optional) Key value of the Patch Group tag. Controls whether to create a PatchGroup tag that can be leveraged via SSM to auto-update instances."
  default     = null
}

variable "PolicyBody" {
  type        = string
  description = "(Optional) String containing the stack policy body. Conflicts with PolicyUrl"
  default     = null
}

variable "PolicyUrl" {
  type        = string
  description = "(Optional) URL to a file containing the stack policy. Conflicts with PolicyBody"
  default     = null
}

variable "RootVolumeSize" {
  type        = string
  description = "(Optional) Root Volume Size in GB **NOTE** This value can be set larger than the default (30GB) but NOT smaller."
  default     = "30"
}

variable "StackTags" {
  type        = map(string)
  description = "(Optional) A map of tag keys/values to associate with this stack"
  default     = {}
}

variable "TimeoutInMinutes" {
  type        = string
  description = "(Optional) The amount of time that can pass before the stack status becomes CREATE_FAILED"
  default     = "30"
}

variable "AmiId" {
  type        = string
  description = "(Required) ID of the AMI to launch"
}

variable "AppScriptParams" {
  type        = string
  description = "(Optional) Parameter string to pass to the application script. Ignored if AppScriptUrl is blank"
  default     = ""
}

variable "AppScriptUrl" {
  type        = string
  description = "(Optional) S3 URL to the .ps1 or .bat application script in an S3 bucket (s3://). Leave blank to launch without an application script. If specified, an appropriate InstanceRole is required"
  default     = null
}

variable "AppVolumeDevice" {
  type        = string
  description = "#(Optional) Device to mount an extra EBS volume. Leave blank to launch without an extra application volume"
  default     = null
}

variable "AppVolumeType" {
  type        = string
  description = "(Optional) Type of EBS volume to create. Ignored if AppVolumeDevice is blank"
  default     = "gp2"
}

variable "AppVolumeSize" {
  type        = string
  description = "(Optional) Size in GB of the EBS volume to create. Ignored if AppVolumeDevice is blank"
  default     = "1"
}

variable "AppVolumeSnapshotId" {
  type        = string
  description = "(Optional) EBS Snapshot ID from which to create the AppVolume. \"AppVolumeSize\" must be equal or greater than the size of the snapshot. Ignored if \"AppVolumeDevice\" is blank"
  default     = null
}

variable "KeyPairName" {
  type        = string
  description = "(Required) Public/private key pairs allow you to securely connect to your instance after it launches"
}

variable "InstanceType" {
  type        = string
  description = "(Optional) Amazon EC2 instance type"
  default     = "t2.micro"
}

variable "InstanceRole" {
  type        = string
  description = "(Optional) IAM instance role to apply to the instance"
  default     = null
}

variable "PrivateIp" {
  type        = string
  description = "(Optional) Set a static, primary private IP. Leave blank to auto-select a free IP"
  default     = null
}

variable "NoPublicIp" {
  type        = bool
  description = "(Optional) Controls whether to assign the instance a public IP. Recommended to leave at true _unless_ launching in a public subnet"
  default     = true
}

variable "NoReboot" {
  type        = bool
  description = "(Optional) Controls whether to reboot the instance as the last step of cfn-init execution"
  default     = false
}

variable "SecurityGroupIds" {
  type        = string
  description = "(Required) List of security groups to apply to the instance"
}

variable "SubnetId" {
  type        = string
  description = "(Required) ID of the subnet to assign to the instance"
}

variable "PypiIndexUrl" {
  type        = string
  description = "(Optional) URL to the PyPi Index"
  default     = "https://pypi.org/simple"
}

variable "PythonInstaller" {
  type        = string
  description = "(Optional) URL to the Python Installer Executable"
  default     = "https://www.python.org/ftp/python/3.6.4/python-3.6.4-amd64.exe"
}

variable "WatchmakerBootstrapper" {
  type        = string
  description = "(Optional) URL to the Watchmaker PowerShell bootstrapper for Windows"
  default     = "https://raw.githubusercontent.com/plus3it/watchmaker/master/docs/files/bootstrap/watchmaker-bootstrap.ps1"
}

variable "WatchmakerConfig" {
  type        = string
  description = "(Optional) URL to a Watchmaker config file"
  default     = null
}

variable "WatchmakerEnvironment" {
  type        = string
  description = "(Optional) Environment in which the instance is being deployed"
  default     = null
}

variable "WatchmakerOuPath" {
  type        = string
  description = "(Optional) DN of the OU to place the instance when joining a domain. If blank and WatchmakerEnvironment enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if WatchmakerEnvironment is false"
  default     = null
}

variable "WatchmakerComputerName" {
  type        = string
  description = "(Optional) Sets the hostname/computername within the OS"
  default     = null
}

variable "WatchmakerAdminGroups" {
  type        = string
  description = "(Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance"
  default     = null
}

variable "WatchmakerAdminUsers" {
  type        = string
  description = "(Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance"
  default     = null
}

variable "WatchmakerExtraArgs" {
  type        = string
  description = "(Optional) Additional parameters to be passed to the Watchmaker CLI"
  default     = null
}

variable "WatchmakerStandaloneUrl" {
  type        = string
  description = "(Optional) HTTP/S URL to a Watchmaker standalone executable. The file will be retrieved and used to run Watchmaker, instead of installing Watchmaker from PyPi"
  default     = null
}

variable "WatchmakerVersion" {
  type        = string
  description = "(Optional) Watchmaker version to install. When blank (the default) the latest version will be installed. Used only when Watchmaker is installed from PyPi"
  default     = null
}

variable "CloudWatchAgentUrl" {
  type        = string
  description = "(Optional) S3 URL to CloudWatch Agent installer. Example: s3://amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi"
  default     = null
}

variable "CloudWatchAppLogs" {
  type        = list(string)
  description = "(Optional) List of application log file paths to send to CloudWatch. Example: C:\\dir1\\file1,C:\\dir2\\file2,C:\\dir3\\file3"
  default     = []
}

variable "CfnEndpointUrl" {
  type        = string
  description = "(Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com"
  default     = "https://cloudformation.us-east-1.amazonaws.com"
}

variable "ToggleCfnInitUpdate" {
  type        = string
  description = "(Optional) A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence"
  default     = "A"
}

variable "DisableApiTermination" {
  type        = bool
  description = "(Optional) Specifies whether the instance can be terminated through the API."
  default     = false
}

variable "EbsOptimized" {
  type        = bool
  description = "(Optional) Specifies whether the instance is optimized for Amazon Elastic Block Store I/O. Warning: Stack creation will fail if set to true and the instance type does not support EBS Optimization. See complete list of supported instances here: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html#ebs-optimization-support"
  default     = false
}
