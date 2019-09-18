# ------------------------------------------------------------------------------------------------------------------------
# This file contains outputs associated with the Linux instance Terraform module.  It is only for example purposes
# as part of the root 'main.tf'.  For other modules, use the accompanying 'outputs.tf' file in that subdirectory.
# ------------------------------------------------------------------------------------------------------------------------

output "watchmaker-lx-instance-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = module.lx-instance.watchmaker-lx-instance-stack-id
}

output "watchmaker-lx-instance-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = module.lx-instance.watchmaker-lx-instance-stack-outputs
}
