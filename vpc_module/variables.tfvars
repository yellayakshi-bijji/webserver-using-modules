#declaring input variables without assigning them any initial values, can be used to parameterize our code, allowing us to provide different values when running our terraform deployment
variable "vpc_cidr_range" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "allowallcidr" {}
variable "avail_zone" {}