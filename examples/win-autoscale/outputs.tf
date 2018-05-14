#Outputs from the Windows Autoscaling Terraform module.

output "watchmaker-win-autoscale-stack-id" {
  description = "This output provides the CloudFormation Stack ID"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-stack-id}"
}

output "watchmaker-win-autoscale-scale-down-scheduled-action" {
  description = "This output provides the Scale Down Scheduled Action ID"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-scale-down-scheduled-action}"
}

output "watchmaker-win-autoscale-scale-up-scheduled-action" {
  description = "This output provides the Scale Up Scheduled Action ID"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-scale-up-scheduled-action}"
}

output "watchmaker-win-autoscale-autoscaling-group-id" {
  description = "This output provides the Autoscaling Group ID"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-autoscaling-group-id}"
}

output "watchmaker-win-autoscale-launch-config-id" {
  description = "This output provides the Launch Configuration ID"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-launch-config-id}"
}

output "watchmaker-win-autoscale-launch-config-log-group-name" {
  description = "This output provides the Log Group Name"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-launch-config-log-group-name}"
}
