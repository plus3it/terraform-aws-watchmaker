#Outputs from the Windows Instance Terraform module.

output "watchmaker-win-instance-stack-id" {
  description = "This output provides the CloudFormation Stack ID"
  value       = module.win-instance.watchmaker-win-instance-stack-id
}

output "watchmaker-win-instance-id" {
  description = "This output provides the Instance ID"
  value       = module.win-instance.watchmaker-win-instance-id
}

output "watchmaker-win-instance-log-group-name" {
  description = "This output provides the Log Group Name"
  value       = module.win-instance.watchmaker-win-instance-log-group-name
}
