# Terraform module to create a Watchmaker Linux Autoscaling Group using a CloudFormation template.
# Assumes that the Watchmaker Cloudformation template is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-lx-autoscale" {
  template_body = file("${path.module}/watchmaker-lx-autoscale.template.cfn.yaml")

  name               = var.Name
  capabilities       = var.Capabilities
  disable_rollback   = var.DisableRollback
  iam_role_arn       = var.IamRoleArn
  notification_arns  = var.NotificationArns
  on_failure         = var.OnFailureAction
  policy_body        = var.PolicyBody
  policy_url         = var.PolicyUrl
  tags               = var.StackTags
  timeout_in_minutes = var.TimeoutInMinutes

  parameters = {
    AmiDistro                   = var.AmiDistro
    AmiId                       = var.AmiId
    AppScriptParams             = var.AppScriptParams
    AppScriptShell              = var.AppScriptShell
    AppScriptUrl                = var.AppScriptUrl
    AppVolumeDevice             = var.AppVolumeDevice
    AppVolumeDeviceName         = var.AppVolumeDeviceName
    AppVolumeMountPath          = var.AppVolumeMountPath
    AppVolumeEncrypted          = var.AppVolumeEncrypted
    AppVolumeSize               = var.AppVolumeSize
    AppVolumeSnapshotId         = var.AppVolumeSnapshotId
    AppVolumeType               = var.AppVolumeType
    AsgMetrics                  = join(",", var.AsgMetrics)
    AsgNotificationTypes        = join(",", var.AsgNotificationTypes)
    AsgSnsArn                   = var.AsgSnsArn
    CfnEndpointUrl              = var.CfnEndpointUrl
    CfnStackSignalTimeout       = var.TimeoutInMinutes
    CloudWatchAgentUrl          = var.CloudWatchAgentUrl
    CloudWatchAppLogs           = join(",", var.CloudWatchAppLogs)
    DesiredCapacity             = var.DesiredCapacity
    EbsOptimized                = var.EbsOptimized
    EnableRepos                 = var.EnableRepos
    InstanceRole                = var.InstanceRole
    InstanceTerminationPolicies = join(",", var.InstanceTerminationPolicies)
    InstanceType                = var.InstanceType
    KeyPairName                 = var.KeyPairName
    LoadBalancerNames           = var.LoadBalancerNames
    MaxCapacity                 = var.MaxCapacity
    MinCapacity                 = var.MinCapacity
    NoPublicIp                  = var.NoPublicIp
    NoReboot                    = var.NoReboot
    NoUpdates                   = var.NoUpdates
    PatchGroup                  = var.PatchGroup
    PypiIndexUrl                = var.PypiIndexUrl
    RootVolumeEncrypted         = var.RootVolumeEncrypted
    RootVolumeSize              = var.RootVolumeSize
    ScaleDownSchedule           = var.ScaleDownSchedule
    ScaleUpSchedule             = var.ScaleUpSchedule
    SecurityGroupIds            = var.SecurityGroupIds
    SubnetIds                   = var.SubnetIds
    TargetGroupArns             = var.TargetGroupArns
    ToggleCfnInitUpdate         = var.ToggleCfnInitUpdate
    ToggleNewInstances          = var.ToggleNewInstances
    WatchmakerAdminGroups       = var.WatchmakerAdminGroups
    WatchmakerAdminUsers        = var.WatchmakerAdminUsers
    WatchmakerConfig            = var.WatchmakerConfig
    WatchmakerEnvironment       = var.WatchmakerEnvironment
    WatchmakerExtraArgs         = var.WatchmakerExtraArgs
    WatchmakerOuPath            = var.WatchmakerOuPath
    WatchmakerStandaloneUrl     = var.WatchmakerStandaloneUrl
    WatchmakerVersion           = var.WatchmakerVersion
  }

  timeouts {
    create = "${var.TimeoutInMinutes}m"
    delete = "${var.TimeoutInMinutes}m"
    update = "${var.TimeoutInMinutes}m"
  }
}
