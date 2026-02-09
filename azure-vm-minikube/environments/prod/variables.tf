variable "location" { default = "eastus" }
variable "admin_password" {}
variable "admin_user" {}

variable "allowed_ip" {
  description = "Public IP allowed to RDP"
  type        = string
}
