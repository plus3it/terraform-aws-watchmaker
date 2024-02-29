variable "AsgMetrics" {
  type        = list(string)
  description = "(Optional) Autoscaling group metrics"
  default     = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

variable "AsgNotificationTypes" {
  type        = list(string)
  description = "(Optional) Autoscaling group notification types"
  default     = ["autoscaling:EC2_INSTANCE_LAUNCH", "autoscaling:EC2_INSTANCE_LAUNCH_ERROR", "autoscaling:EC2_INSTANCE_TERMINATE", "autoscaling:EC2_INSTANCE_TERMINATE_ERROR", "autoscaling:TEST_NOTIFICATION"]
}

variable "build_id" {
  type        = string
  description = "(Optional) Build ID"
  default     = null
}

variable "cloudwatch_agent_url_lx" {
  type        = string
  description = "(Optional) CloudWatch agent CentOS URL"
  default     = "s3://amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm"
}

variable "cloudwatch_agent_url_win" {
  type        = string
  description = "(Optional) CloudWatch agent Windows URL"
  default     = "s3://amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi"
}

variable "instance_role" {
  type        = string
  description = "(Optional) Instance role"
  default     = null
}

variable "keypair_name" {
  type        = string
  description = "(Optional) Keypair name"
  default     = null
}

variable "kmskey_id" {
  type        = string
  description = "(Optional) KMS key id/arn"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "(Required) Subnet ID"
}

variable "security_group" {
  type        = string
  description = "(Optional) Security group"
  default     = null
}

variable "watchmaker_config" {
  type        = string
  description = "(Optional) Path to a Watchmaker config file.  The config file path can be a remote source (i.e. http[s]://, s3://) or local directory (i.e. file://)"
  default     = null
}

variable "watchmaker_env" {
  type        = string
  description = "(Optional) Environment in which the instance is being deployed"
  default     = null
}
