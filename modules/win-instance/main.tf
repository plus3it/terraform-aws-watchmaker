# Terraform module to create a Watchmaker Windows instance using a CloudFormation template
# Assumes that the template is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-win-instance" {
  template_body = "${file("${path.module}/watchmaker-win-instance.template.cfn.yaml")}"

  name               = "${var.Name}"
  capabilities       = "${var.Capabilities}"
  disable_rollback   = "${var.DisableRollback}"
  iam_role_arn       = "${var.IamRoleArn}"
  notification_arns  = "${var.NotificationArns}"
  on_failure         = "${var.OnFailureAction}"
  policy_body        = "${var.PolicyBody}"
  policy_url         = "${var.PolicyUrl}"
  tags               = "${var.StackTags}"
  timeout_in_minutes = "${var.TimeoutInMinutes}"

  parameters = {
    AmiId                   = "${var.AmiId}"
    AppScriptParams         = "${var.AppScriptParams}"
    AppScriptUrl            = "${var.AppScriptUrl}"
    AppVolumeDevice         = "${var.AppVolumeDevice}"
    AppVolumeSize           = "${var.AppVolumeSize}"
    AppVolumeSnapshotId     = "${var.AppVolumeSnapshotId}"
    AppVolumeType           = "${var.AppVolumeType}"
    CfnEndpointUrl          = "${var.CfnEndpointUrl}"
    CfnStackSignalTimeout   = "${var.TimeoutInMinutes}"
    CloudWatchAgentUrl      = "${var.CloudWatchAgentUrl}"
    CloudWatchAppLogs       = "${join(",", var.CloudWatchAppLogs)}"
    DisableApiTermination   = "${var.DisableApiTermination}"
    EbsOptimized            = "${var.EbsOptimized}"
    InstanceRole            = "${var.InstanceRole}"
    InstanceType            = "${var.InstanceType}"
    KeyPairName             = "${var.KeyPairName}"
    NoPublicIp              = "${var.NoPublicIp}"
    NoReboot                = "${var.NoReboot}"
    PatchGroup              = "${var.PatchGroup}"
    PrivateIp               = "${var.PrivateIp}"
    PypiIndexUrl            = "${var.PypiIndexUrl}"
    PythonInstaller         = "${var.PythonInstaller}"
    RootVolumeSize          = "${var.RootVolumeSize}"
    SecurityGroupIds        = "${var.SecurityGroupIds}"
    SubnetId                = "${var.SubnetId}"
    ToggleCfnInitUpdate     = "${var.ToggleCfnInitUpdate}"
    WatchmakerAdminGroups   = "${var.WatchmakerAdminGroups}"
    WatchmakerAdminUsers    = "${var.WatchmakerAdminUsers}"
    WatchmakerBootstrapper  = "${var.WatchmakerBootstrapper}"
    WatchmakerComputerName  = "${var.WatchmakerComputerName}"
    WatchmakerConfig        = "${var.WatchmakerConfig}"
    WatchmakerEnvironment   = "${var.WatchmakerEnvironment}"
    WatchmakerExtraArgs     = "${var.WatchmakerExtraArgs}"
    WatchmakerOuPath        = "${var.WatchmakerOuPath}"
    WatchmakerStandaloneUrl = "${var.WatchmakerStandaloneUrl}"
    WatchmakerVersion       = "${var.WatchmakerVersion}"
  }

  timeouts {
    create  = "${var.TimeoutInMinutes}m"
    delete  = "${var.TimeoutInMinutes}m"
    update  = "${var.TimeoutInMinutes}m"
  }
}
