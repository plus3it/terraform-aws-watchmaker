#Outputs from the Linux Autoscaling Terraform module.

output "watchmaker-lx-autoscale-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = "${module.lx-autoscale.watchmaker-lx-autoscale-stack-id}"
}

output "watchmaker-lx-instance-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = "${module.lx-autoscale.watchmaker-lx-autoscale-stack-outputs}"
}
