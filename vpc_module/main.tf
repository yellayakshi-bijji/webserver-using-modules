#creating a vpc
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc_ws"
  }
}

#creating an Internet Gateway
resource "aws_internet_gateway" "igw" {
  depends_on = [aws_vpc.vpc, ]
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = "igw_ws"
  }
}

#creating a public subnet
resource "aws_subnet" "publicsubnet" {
  depends_on        = [aws_vpc.vpc, ]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.avail_zone

  tags = {
    Name = "publicsubnet_ws"
  }
}

#creating a public route table
resource "aws_route_table" "publicrt" {
  depends_on = [aws_vpc.vpc, aws_internet_gateway.igw, ]
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = "publicrt_ws"
  }

}

#creating a public route
resource "aws_route" "publicroute" {
  depends_on             = [aws_internet_gateway.igw, aws_subnet.publicsubnet]
  route_table_id         = aws_route_table.publicrt.id
  destination_cidr_block = var.allowallcidr
  gateway_id             = aws_internet_gateway.igw.id
}

#associating public routetable with public subnet
resource "aws_route_table_association" "publicrtsassociation" {
  depends_on     = [aws_subnet.publicsubnet, aws_route_table.publicrt, ]
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicrt.id
}

#creating a private subnet
resource "aws_subnet" "privatesubnet" {
  depends_on        = [aws_vpc.vpc, ]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.avail_zone

  tags = {
    Name = "privatesubnet_ws"
  }
}

#creating a private route table
resource "aws_route_table" "privatert" {
  depends_on = [aws_vpc.vpc, ]
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = "privatert_ws"
  }
}

#private route is not necessary

#associating private route table with private subnet
resource "aws_route_table_association" "privatertsassociation" {
  depends_on     = [aws_subnet.privatesubnet, aws_route_table.privatert, ]
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.privatert.id
}