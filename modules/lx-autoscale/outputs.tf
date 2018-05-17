#Outputs from the Linux Autoscaling Terraform module.

output "watchmaker-lx-autoscale-stack-id" {
  description = "CloudFormation stack id"
  value       = "${aws_cloudformation_stack.watchmaker-lx-autoscale.id}"
}

output "watchmaker-lx-autoscale-scale-down-scheduled-action" {
  description = "Scale Down Scheduled Action ID"
  value       = "${lookup(aws_cloudformation_stack.watchmaker-lx-autoscale.outputs, "ScaleDownScheduledAction", "")}"
}

output "watchmaker-lx-autoscale-scale-up-scheduled-action" {
  description = "Scale Up Scheduled Action ID"
  value       = "${lookup(aws_cloudformation_stack.watchmaker-lx-autoscale.outputs, "ScaleUpScheduledAction", "")}"
}

output "watchmaker-lx-autoscale-autoscaling-group-id" {
  description = "Autoscaling Group ID"
  value       = "${lookup(aws_cloudformation_stack.watchmaker-lx-autoscale.outputs, "WatchmakerAutoScalingGroupId", "")}"
}

output "watchmaker-lx-autoscale-launch-config-id" {
  description = "Launch Configuration ID"
  value       = "${lookup(aws_cloudformation_stack.watchmaker-lx-autoscale.outputs, "WatchmakerLaunchConfigId", "")}"
}

output "watchmaker-lx-autoscale-launch-config-log-group-name" {
  description = "Log Group Name"
  value       = "${lookup(aws_cloudformation_stack.watchmaker-lx-autoscale.outputs, "WatchmakerLaunchConfigLogGroupName", "")}"
}
