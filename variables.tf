# ------------------------------------------------------------------------------------------------------------------------
# This file contains variables associated with the Linux instance Terraform module.  It is only for example purposes
# as part of the root 'main.tf'.  For other modules, use the accompanying 'variables.tf' file in that subdirectory.
# ------------------------------------------------------------------------------------------------------------------------

variable "Name" {
  type        = "string"
  description = "Name of CloudFormation Stack"
}

variable "AmiId" {
  type        = "string"
  description = "ID of the AMI to launch"
}

variable "AmiDistro" {
  type        = "string"
  description = "Linux distro of the AMI"
}

variable "AppScriptParams" {
  type        = "string"
  description = "Parameter string to pass to the application script. Ignored if AppScriptUrl is blank"
  default     = ""
}

variable "AppScriptShell" {
  type        = "string"
  description = "Shell with which to execute the application script. Ignored if AppScriptUrl is blank"
  default     = "bash"
}

variable "AppScriptUrl" {
  type        = "string"
  description = "(Optional) S3 URL to the application script in an S3 bucket (s3://). Leave blank to launch without an application script. If specified, an appropriate InstanceRole is required"
  default     = ""
}

variable "AppVolumeDevice" {
  type        = "string"
  description = "(Optional) Device to mount an extra EBS volume. Leave blank to launch without an extra application volume"
  default     = ""
}

variable "AppVolumeMountPath" {
  type        = "string"
  description = "Filesystem path to mount the extra app volume. Ignored if AppVolumeDevice is blank"
  default     = "/opt/data"
}

variable "AppVolumeType" {
  type        = "string"
  description = "Type of EBS volume to create. Ignored if AppVolumeDevice is blank"
  default     = "gp2"
}

variable "AppVolumeSize" {
  type        = "string"
  description = "Size in GB of the EBS volume to create. Ignored if AppVolumeDevice is blank"
  default     = "1"
}

variable "KeyPairName" {
  type        = "string"
  description = "Public/private key pairs allow you to securely connect to your instance after it launches"
}

variable "InstanceType" {
  type        = "string"
  description = "Amazon EC2 instance type"
  default     = "t2.micro"
}

variable "InstanceRole" {
  type        = "string"
  description = "(Optional) IAM instance role to apply to the instance"
  default     = ""
}

variable "PrivateIp" {
  type        = "string"
  description = "(Optional) Set a static, primary private IP. Leave blank to auto-select a free IP"
  default     = ""
}

variable "NoPublicIp" {
  type        = "string"
  description = "Controls whether to assign the instance a public IP. Recommended to leave at true _unless_ launching in a public subnet"
  default     = "true"
}

variable "NoReboot" {
  type        = "string"
  description = "Controls whether to reboot the instance as the last step of cfn-init execution"
  default     = "false"
}

variable "NoUpdates" {
  type        = "string"
  description = "Controls whether to run yum update during a stack update (On the initial instance launch, Watchmaker _always_ installs updates)"
  default     = "false"
}

variable "SecurityGroupIds" {
  type        = "string"
  description = "List of security groups to apply to the instance"
}

variable "SubnetId" {
  type        = "string"
  description = "ID of the subnet to assign to the instance"
}

variable "PypiIndexUrl" {
  type        = "string"
  description = "URL to the PyPi Index"
  default     = "https://pypi.org/simple"
}

variable "WatchmakerConfig" {
  type        = "string"
  description = "(Optional) URL to a Watchmaker config file"
  default     = ""
}

variable "WatchmakerEnvironment" {
  type        = "string"
  description = "Environment in which the instance is being deployed"
  default     = ""
}

variable "WatchmakerOuPath" {
  type        = "string"
  description = "(Optional) DN of the OU to place the instance when joining a domain. If blank and WatchmakerEnvironment enforces a domain join, the instance will be placed in a default container. Leave blank if not joining a domain, or if WatchmakerEnvironment is false"
  default     = ""
}

variable "WatchmakerComputerName" {
  type        = "string"
  description = "(Optional) Sets the hostname/computername within the OS"
  default     = ""
}

variable "WatchmakerAdminGroups" {
  type        = "string"
  description = "(Optional) Colon-separated list of domain groups that should have admin permissions on the EC2 instance"
  default     = ""
}

variable "WatchmakerAdminUsers" {
  type        = "string"
  description = "(Optional) Colon-separated list of domain users that should have admin permissions on the EC2 instance"
  default     = ""
}

variable "WatchmakerS3Source" {
  type        = "string"
  description = "Flag that tells watchmaker to use its instance role to retrieve watchmaker content from S3"
  default     = "false"
}

variable "CfnEndpointUrl" {
  type        = "string"
  description = "(Optional) URL to the CloudFormation Endpoint. e.g. https://cloudformation.us-east-1.amazonaws.com"
  default     = "https://cloudformation.us-east-1.amazonaws.com"
}

variable "CfnGetPipUrl" {
  type        = "string"
  description = "URL to get-pip.py"
  default     = "https://bootstrap.pypa.io/2.6/get-pip.py"
}

variable "CfnBootstrapUtilsUrl" {
  type        = "string"
  description = "URL to aws-cfn-bootstrap-latest.tar.gz"
  default     = "https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz"
}

variable "ToggleCfnInitUpdate" {
  type        = "string"
  description = "A/B toggle that forces a change to instance metadata, triggering the cfn-init update sequence"
  default     = "A"
}
