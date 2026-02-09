variable "name" {}
variable "rg_name" {}
variable "location" {}

variable "admin_user" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}


variable "size" {
  type    = string
  default = "Standard_D2s_v3"
}