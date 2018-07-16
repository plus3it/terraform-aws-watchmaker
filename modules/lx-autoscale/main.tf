# Terraform module to create a Watchmaker Linux Autoscaling Group using a CloudFormation cfn.json
# Assumes that watchmaker-lx-autoscale.cfn.json is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-lx-autoscale" {
  name = "${var.Name}"

  parameters {
    AmiId                 = "${var.AmiId}"
    AmiDistro             = "${var.AmiDistro}"
    AppScriptParams       = "${var.AppScriptParams}"
    AppScriptShell        = "${var.AppScriptShell}"
    AppScriptUrl          = "${var.AppScriptUrl}"
    AppVolumeDevice       = "${var.AppVolumeDevice}"
    AppVolumeMountPath    = "${var.AppVolumeMountPath}"
    AppVolumeType         = "${var.AppVolumeType}"
    AppVolumeSize         = "${var.AppVolumeSize}"
    CloudWatchAgentUrl    = "${var.CloudWatchAgentUrl}"
    KeyPairName           = "${var.KeyPairName}"
    InstanceType          = "${var.InstanceType}"
    InstanceRole          = "${var.InstanceRole}"
    MinCapacity           = "${var.MinCapacity}"
    MaxCapacity           = "${var.MaxCapacity}"
    DesiredCapacity       = "${var.DesiredCapacity}"
    ScaleDownSchedule     = "${var.ScaleDownSchedule}"
    ScaleUpSchedule       = "${var.ScaleUpSchedule}"
    NoPublicIp            = "${var.NoPublicIp}"
    NoReboot              = "${var.NoReboot}"
    NoUpdates             = "${var.NoUpdates}"
    SecurityGroupIds      = "${var.SecurityGroupIds}"
    SubnetIds             = "${var.SubnetIds}"
    TargetGroupArns       = "${var.TargetGroupArns}"
    PypiIndexUrl          = "${var.PypiIndexUrl}"
    WatchmakerConfig      = "${var.WatchmakerConfig}"
    WatchmakerEnvironment = "${var.WatchmakerEnvironment}"
    WatchmakerOuPath      = "${var.WatchmakerOuPath}"
    WatchmakerAdminGroups = "${var.WatchmakerAdminGroups}"
    WatchmakerAdminUsers  = "${var.WatchmakerAdminUsers}"
    CfnEndpointUrl        = "${var.CfnEndpointUrl}"
    CfnGetPipUrl          = "${var.CfnGetPipUrl}"
    CfnBootstrapUtilsUrl  = "${var.CfnBootstrapUtilsUrl}"
    ToggleCfnInitUpdate   = "${var.ToggleCfnInitUpdate}"
    ToggleNewInstances    = "${var.ToggleNewInstances}"
  }

  on_failure = "${var.OnFailureAction}"

  template_body = "${file("${path.module}/watchmaker-lx-autoscale.template.cfn.json")}"
}
