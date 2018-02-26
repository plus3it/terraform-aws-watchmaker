# Terraform module to create a Watchmaker Windows Autoscaling Group using a CloudFormation cfn.json
# Assumes that watchmaker-win-autoscale.cfn.json is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-win-autoscale" {
  name = "${var.Name}"

  parameters {
    AmiId                  = "${var.AmiId}"
    AppScriptParams        = "${var.AppScriptParams}"
    AppScriptUrl           = "${var.AppScriptUrl}"
    AppVolumeDevice        = "${var.AppVolumeDevice}"
    AppVolumeType          = "${var.AppVolumeType}"
    AppVolumeSize          = "${var.AppVolumeSize}"
    KeyPairName            = "${var.KeyPairName}"
    InstanceType           = "${var.InstanceType}"
    InstanceRole           = "${var.InstanceRole}"
    MinCapacity            = "${var.MinCapacity}"
    MaxCapacity            = "${var.MaxCapacity}"
    DesiredCapacity        = "${var.DesiredCapacity}"
    NoPublicIp             = "${var.NoPublicIp}"
    NoReboot               = "${var.NoReboot}"
    SecurityGroupIds       = "${var.SecurityGroupIds}"
    SubnetIds              = "${var.SubnetIds}"
    PypiIndexUrl           = "${var.PypiIndexUrl}"
    PythonInstaller        = "${var.PythonInstaller}"
    WatchmakerBootstrapper = "${var.WatchmakerBootstrapper}"
    WatchmakerConfig       = "${var.WatchmakerConfig}"
    WatchmakerEnvironment  = "${var.WatchmakerEnvironment}"
    WatchmakerOuPath       = "${var.WatchmakerOuPath}"
    WatchmakerAdminGroups  = "${var.WatchmakerAdminGroups}"
    CfnEndpointUrl         = "${var.CfnEndpointUrl}"
    ToggleCfnInitUpdate    = "${var.ToggleCfnInitUpdate}"
    ToggleNewInstances     = "${var.ToggleNewInstances}"
  }

  on_failure = "${var.OnFailureAction}"

  template_body = "${file("${path.module}/watchmaker-win-autoscale.cfn.json")}"
}
