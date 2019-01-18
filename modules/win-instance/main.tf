# Terraform module to create a Watchmaker Windows instance using a CloudFormation cfn.json
# Assumes that watchmaker-win-instance.cfn.json is stored in the same directory as main.tf of the module.

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

  parameters {
    AmiId                  = "${var.AmiId}"
    AppScriptParams        = "${var.AppScriptParams}"
    AppScriptUrl           = "${var.AppScriptUrl}"
    AppVolumeDevice        = "${var.AppVolumeDevice}"
    AppVolumeType          = "${var.AppVolumeType}"
    AppVolumeSize          = "${var.AppVolumeSize}"
    CloudWatchAgentUrl     = "${var.CloudWatchAgentUrl}"
    CloudWatchAppLogs      = "${join(",", var.CloudWatchAppLogs)}"
    KeyPairName            = "${var.KeyPairName}"
    InstanceType           = "${var.InstanceType}"
    InstanceRole           = "${var.InstanceRole}"
    PrivateIp              = "${var.PrivateIp}"
    NoPublicIp             = "${var.NoPublicIp}"
    NoReboot               = "${var.NoReboot}"
    PatchGroup             = "${var.PatchGroup}"
    SecurityGroupIds       = "${var.SecurityGroupIds}"
    SubnetId               = "${var.SubnetId}"
    PypiIndexUrl           = "${var.PypiIndexUrl}"
    PythonInstaller        = "${var.PythonInstaller}"
    WatchmakerBootstrapper = "${var.WatchmakerBootstrapper}"
    WatchmakerConfig       = "${var.WatchmakerConfig}"
    WatchmakerEnvironment  = "${var.WatchmakerEnvironment}"
    WatchmakerOuPath       = "${var.WatchmakerOuPath}"
    WatchmakerComputerName = "${var.WatchmakerComputerName}"
    WatchmakerAdminGroups  = "${var.WatchmakerAdminGroups}"
    WatchmakerAdminUsers   = "${var.WatchmakerAdminUsers}"
    WatchmakerExtraArgs    = "${var.WatchmakerExtraArgs}"
    CfnEndpointUrl         = "${var.CfnEndpointUrl}"
    ToggleCfnInitUpdate    = "${var.ToggleCfnInitUpdate}"
  }
}
