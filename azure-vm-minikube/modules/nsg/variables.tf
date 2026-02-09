variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "allowed_ip" {
  type    = string
  default = "0.0.0.0/0"
}
