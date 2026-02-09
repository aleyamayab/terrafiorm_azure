variable "location" { default = "centralus" }
variable "admin_user" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}


variable "allowed_ip" {
  description = "Public IP allowed to RDP"
  type        = string
}