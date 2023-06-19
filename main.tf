module "vpc" {
  source              = ".//vpc_module"
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  allowallcidr        = var.allowallcidr
  avail_zone          = var.avail_zone
}

module "webserver" {
  source          = ".//ec2_module"
  linux_ami_id    = var.linux_ami_id
  instance_type   = var.instance_type
  keypair         = var.keypair
  publicsubnetid  = module.vpc.publicsubnetid
  securitygroupid = [module.securitygroup.securitygroupid]
}

module "securitygroup" {
  source     = ".//securitygroup_module"
  vpcid      = module.vpc.vpcid
  myip       = var.myip
  officeip   = var.officeip
  ssh_port   = var.ssh_port
  http_port  = var.http_port
  https_port = var.https_port
  protocol   = var.protocol
}

