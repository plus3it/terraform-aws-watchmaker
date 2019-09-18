#Outputs from the Linux Instance Terraform module.

output "watchmaker-lx-instance" {
  description = "CloudFormation stack object for watchmaker-lx-instance"
  value       = module.lx-instance.watchmaker-lx-instance
}

output "watchmaker-lx-instance-id" {
  description = "This output provides the Instance ID"
  value       = module.lx-instance.watchmaker-lx-instance.id
}

output "watchmaker-lx-instance-log-group-name" {
  description = "This output provides the Log Group Name"
  value = lookup(
    module.lx-instance.watchmaker-lx-instance.outputs,
    "WatchmakerLaunchConfigLogGroupName",
    "",
  )
}
