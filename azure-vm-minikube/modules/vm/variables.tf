variable "name" {}
variable "rg_name" {}
variable "location" {}
variable "subnet_id" {}
variable "nsg_id" {}

variable "admin_user" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "size" {
  type    = string
  default = "Standard_B1s"
}
}