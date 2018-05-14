#Outputs from the Linux Instance Terraform module.

output "watchmaker-lx-instance-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = "${module.lx-instance.watchmaker-lx-instance-stack-id}"
}

output "watchmaker-lx-instance-id" {
  description = "This output provides the Instance ID"
  value       = "${module.win-instance.watchmaker-lx-instance-id}"
}

output "watchmaker-lx-instance-log-group-name" {
  description = "This output provides the Log Group Name"
  value       = "${module.win-instance.watchmaker-lx-instance-log-group-name}"
}
