variable "name" {}
variable "rg_name" {}
variable "location" {}
variable "subnet_id" {}
variable "nsg_id" {}
variable "admin_password" {}
variable "admin_user" { default = "azureadmin" }
variable "size" { default = "Standard_B2s" }
