# Terraform module to create a Watchmaker Windows Autoscaling Group using a CloudFormation template
# Assumes that watchmaker-win-autoscale.template is stored in the same directory as main.tf of the module.

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
    WatchmakerS3Source     = "${var.WatchmakerS3Source}"
    CfnEndpointUrl         = "${var.CfnEndpointUrl}"
    ToggleCfnInitUpdate    = "${var.ToggleCfnInitUpdate}"
    ToggleNewInstances     = "${var.ToggleNewInstances}"
  }

  #on_failure = "DO_NOTHING" #DO_NOTHING , ROLLBACK, DELETE

  #Assumes that watchmaker-win-autoscale.template is stored in same directory as watchmaker-win-autoscale.tf
  template_body = "${file("${path.module}/watchmaker-win-autoscale.template")}"
}
