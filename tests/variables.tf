variable "build_id" {
  default = ""
  type    = "string"
}

variable "cloudwatch_agent_url_lx" {
  default = "s3://amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip"
  type    = "string"
}

variable "cloudwatch_agent_url_win" {
  default = "s3://amazoncloudwatch-agent/windows/amd64/latest/AmazonCloudWatchAgent.zip"
  type    = "string"
}

variable "instance_role" {
  default = ""
  type    = "string"
}

variable "keypair_name" {
  default = ""
  type    = "string"
}

variable "subnet_id" {
  type = "string"
}

variable "security_group" {
  default = ""
  type    = "string"
}

variable "watchmaker_config" {
  default     = ""
  type        = "string"
  description = "(Optional) Path to a Watchmaker config file.  The config file path can be a remote source (i.e. http[s]://, s3://) or local directory (i.e. file://)"
}

variable "watchmaker_env" {
  default     = ""
  type        = "string"
  description = "Environment in which the instance is being deployed"
}
