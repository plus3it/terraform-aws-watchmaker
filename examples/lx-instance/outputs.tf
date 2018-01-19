#Outputs from the Linux Instance Terraform module.

output "watchmaker-lx-instance-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = "${module.lx-instance.watchmaker-lx-instance-stack-id}"
}

output "watchmaker-lx-instance-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = "${module.lx-instance.watchmaker-lx-instance-stack-outputs}"
}
