#Outputs from the Windows Autoscaling Terraform module.

output "watchmaker-win-autoscale-stack-id" {
  description = "CloudFormation stack id"
  value       = "${aws_cloudformation_stack.watchmaker-win-autoscale.id}"
}

output "watchmaker-win-autoscale-scale-down-scheduled-action" {
  description = "Scale Down Scheduled Action ID"
  value       = "${lookup(aws_cloudformation_stack.watchmaker-win-autoscale.outputs, "ScaleDownScheduledAction", "UNDEFINED")}"
}

output "watchmaker-win-autoscale-scale-up-scheduled-action" {
  description = "Scale Up Scheduled Action ID"
  value       = "${lookup(aws_cloudformation_stack.watchmaker-win-autoscale.outputs, "ScaleUpScheduledAction", "UNDEFINED")}"
}

output "watchmaker-win-autoscale-autoscaling-group-id" {
  description = "Autoscaling Group ID"
  value       = "${aws_cloudformation_stack.watchmaker-win-autoscale.outputs["WatchmakerAutoScalingGroupId"]}"
}

output "watchmaker-win-autoscale-launch-config-id" {
  description = "Launch Configuration ID"
  value       = "${aws_cloudformation_stack.watchmaker-win-autoscale.outputs["WatchmakerLaunchConfigId"]}"
}

output "watchmaker-win-autoscale-launch-config-log-group-name" {
  description = "Log Group Name"
  value       = "${aws_cloudformation_stack.watchmaker-win-autoscale.outputs["WatchmakerLaunchConfigLogGroupName"]}"
}
