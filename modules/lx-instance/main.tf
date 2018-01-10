# Module to create a watchmaker-lx-instance CloudFormation stack
# Assumes that watchmaker-lx-instance.template is stored in 'template' subdirectory of the module.

resource "aws_cloudformation_stack" "watchmaker-lx-instance" {
  name = "${var.Name}"

  parameters {
    AmiId                  = "${var.AmiId}"
    AmiDistro              = "${var.AmiDistro}"
    AppScriptParams        = "${var.AppScriptParams}"
    AppScriptShell         = "${var.AppScriptShell}"
    AppScriptUrl           = "${var.AppScriptUrl}"
    AppVolumeDevice        = "${var.AppVolumeDevice}"
    AppVolumeMountPath     = "${var.AppVolumeMountPath}"
    AppVolumeType          = "${var.AppVolumeType}"
    AppVolumeSize          = "${var.AppVolumeSize}"
    KeyPairName            = "${var.KeyPairName}"
    InstanceType           = "${var.InstanceType}"
    InstanceRole           = "${var.InstanceRole}"
    PrivateIp              = "${var.PrivateIp}"
    NoPublicIp             = "${var.NoPublicIp}"
    NoReboot               = "${var.NoReboot}"
    NoUpdates              = "${var.NoUpdates}"
    SecurityGroupIds       = "${var.SecurityGroupIds}"
    SubnetId               = "${var.SubnetId}"
    PypiIndexUrl           = "${var.PypiIndexUrl}"
    WatchmakerConfig       = "${var.WatchmakerConfig}"
    WatchmakerEnvironment  = "${var.WatchmakerEnvironment}"
    WatchmakerOuPath       = "${var.WatchmakerOuPath}"
    WatchmakerComputerName = "${var.WatchmakerComputerName}"
    WatchmakerAdminGroups  = "${var.WatchmakerAdminGroups}"
    WatchmakerAdminUsers   = "${var.WatchmakerAdminUsers}"
    WatchmakerS3Source     = "${var.WatchmakerS3Source}"
    CfnEndpointUrl         = "${var.CfnEndpointUrl}"
    CfnGetPipUrl           = "${var.CfnGetPipUrl}"
    CfnBootstrapUtilsUrl   = "${var.CfnBootstrapUtilsUrl}"
    ToggleCfnInitUpdate    = "${var.ToggleCfnInitUpdate}"
  }

  on_failure = "DO_NOTHING" //DO_NOTHING , ROLLBACK, DELETE

  #Assumes that watchmaker-lx-instance.template is stored in same directory as watchmaker-lx-instance.tf
  template_body = "${file("${path.module}/watchmaker-lx-instance.template")}"
}
