# Cloudformation Terraform module for a Linux Watchmaker instance

module "lx-instance" {
  source = "./modules/lx-instance"

  Name                   = "${var.Name}"
  AmiId                  = "${var.AmiId}"
  AmiDistro              = "${var.AmiDistro}"
}
