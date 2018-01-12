# Terraform module to create a Watchmaker Linux Autoscaling Group using a CloudFormation template
# Assumes that watchmaker-lx-autoscale.template is stored in the same directory as main.tf of the module.

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
    KeyPairName           = "${var.KeyPairName}"
    InstanceType          = "${var.InstanceType}"
    InstanceRole          = "${var.InstanceRole}"
    MinCapacity           = "${var.MinCapacity}"
    MaxCapacity           = "${var.MaxCapacity}"
    DesiredCapacity       = "${var.DesiredCapacity}"
    NoPublicIp            = "${var.NoPublicIp}"
    NoReboot              = "${var.NoReboot}"
    NoUpdates             = "${var.NoUpdates}"
    SecurityGroupIds      = "${var.SecurityGroupIds}"
    SubnetIds             = "${var.SubnetIds}"
    PypiIndexUrl          = "${var.PypiIndexUrl}"
    WatchmakerConfig      = "${var.WatchmakerConfig}"
    WatchmakerEnvironment = "${var.WatchmakerEnvironment}"
    WatchmakerOuPath      = "${var.WatchmakerOuPath}"
    WatchmakerAdminGroups = "${var.WatchmakerAdminGroups}"
    WatchmakerAdminUsers  = "${var.WatchmakerAdminUsers}"
    WatchmakerS3Source    = "${var.WatchmakerS3Source}"
    CfnEndpointUrl        = "${var.CfnEndpointUrl}"
    CfnGetPipUrl          = "${var.CfnGetPipUrl}"
    CfnBootstrapUtilsUrl  = "${var.CfnBootstrapUtilsUrl}"
    ToggleCfnInitUpdate   = "${var.ToggleCfnInitUpdate}"
    ToggleNewInstances    = "${var.ToggleNewInstances}"
  }

  on_failure = "DO_NOTHING" //DO_NOTHING , ROLLBACK, DELETE

  #Assumes that watchmaker-lx-autoscale.template is stored in same directory as watchmaker-lx-autoscale.tf
  template_body = "${file("${path.module}/watchmaker-lx-autoscale.template")}"
}
