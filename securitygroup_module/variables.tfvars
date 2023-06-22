#declaring input variables without assigning them any initial values, can be used to parameterize our code, allowing us to provide different values when running our terraform deployment

variable "vpcid" {}
variable "ssh_port" {}
variable "http_port" {}
variable "https_port" {}
variable "protocol" {}
variable "myip" {}
variable "officeip" {}
