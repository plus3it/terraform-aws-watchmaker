#Outputs from the Linux Instance Terraform module.

output "watchmaker-lx-instance" {
  description = "CloudFormation stack object for watchmaker-lx-instance"
  value       = module.lx-instance.watchmaker-lx-instance
}
