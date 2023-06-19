#creating a web server
resource "aws_instance" "webserver" {
  ami                         = var.linux_ami_id
  instance_type               = var.instance_type
  key_name                    = var.keypair
  subnet_id                   = var.publicsubnetid
  vpc_security_group_ids      = var.securitygroupid
  source_dest_check           = false
  associate_public_ip_address = true

  tags = {
    Name = "webserver"
  }
}