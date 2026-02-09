variable "name" {}
variable "rg_name" {}
variable "location" {}
variable "subnet_id" {}
variable "nsg_id" {}
variable "ssh_public_key" {}
variable "admin_user" { default = "azureuser" }
variable "size" { default = "Standard_B2s" }
