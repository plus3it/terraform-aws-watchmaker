#Outputs from the Linux Autoscaling Terraform module.

output "watchmaker-lx-autoscale-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = module.lx-autoscale.watchmaker-lx-autoscale-stack-id
}

output "watchmaker-lx-autoscale-stack-down-schedule-action" {
  description = "This output provides the Scale Down Scheduled Action ID"
  value       = module.lx-autoscale.watchmaker-lx-autoscale-scale-down-scheduled-action
}

output "watchmaker-lx-autoscale-stack-up-schedule-action" {
  description = "This output provides the Scale Up Scheduled Action ID"
  value       = module.lx-autoscale.watchmaker-lx-autoscale-scale-up-scheduled-action
}

output "watchmaker-lx-autoscale-autoscaling-group-id" {
  description = "This output provides the Autoscaling Group ID"
  value       = module.lx-autoscale.watchmaker-lx-autoscale-autoscaling-group-id
}

output "watchmaker-lx-autoscale-launch-config-id" {
  description = "This output provides the Launch Configuration ID"
  value       = module.lx-autoscale.watchmaker-lx-autoscale-launch-config-id
}

output "watchmaker-lx-autoscale-launch-config-log-group-name" {
  description = "This output provides the Log Group Name"
  value       = module.lx-autoscale.watchmaker-lx-autoscale-launch-config-log-group-name
}
