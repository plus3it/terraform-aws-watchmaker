# Terraform module to create a Watchmaker Windows instance using a CloudFormation template
# Assumes that watchmaker-win-instance.template is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-win-instance" {
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
    PrivateIp              = "${var.PrivateIp}"
    NoPublicIp             = "${var.NoPublicIp}"
    NoReboot               = "${var.NoReboot}"
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
    WatchmakerS3Source     = "${var.WatchmakerS3Source}"
    CfnEndpointUrl         = "${var.CfnEndpointUrl}"
    ToggleCfnInitUpdate    = "${var.ToggleCfnInitUpdate}"
  }

  on_failure = "DO_NOTHING" #DO_NOTHING , ROLLBACK, DELETE

  #Assumes that watchmaker-win-instance.template is stored in same directory as watchmaker-win-instance.tf
  template_body = "${file("${path.module}/watchmaker-win-instance.template")}"
}
