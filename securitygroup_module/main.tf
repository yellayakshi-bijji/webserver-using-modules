#creating a security group for web server
resource "aws_security_group" "ws_sg" {
  vpc_id      = var.vpcid
  description = "webserver-securitygroup"

  ingress {
    description = "SSH-Ingress CIDR"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.protocol
    cidr_blocks = [var.myip, var.officeip]
  }
  ingress {
    description = "HTTP-Ingress CIDR"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.protocol
    cidr_blocks = [var.myip, var.officeip]
  }
  ingress {
    description = "HTTPS-Ingress CIDR"
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.protocol
    cidr_blocks = [var.myip, var.officeip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ws_sg"
  }
}