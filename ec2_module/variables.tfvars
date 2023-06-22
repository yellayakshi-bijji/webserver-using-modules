#declaring input variables without assigning them any initial values, can be used to parameterize our code, allowing us to provide different values when running our terraform deployment

variable "linux_ami_id" {}
variable "instance_type" {}
variable "keypair" {}
variable "publicsubnetid" {}
variable "securitygroupid" {
  type    = set(string)
  default = []
}