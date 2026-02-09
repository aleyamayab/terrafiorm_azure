variable "location" { default = "eastus" }
variable "ssh_public_key" {}

variable "allowed_ip" {
  description = "Public IP allowed to SSH"
  type        = string
}