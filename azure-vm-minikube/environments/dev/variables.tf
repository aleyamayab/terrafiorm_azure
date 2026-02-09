variable "location" { 
  default = "westus" 
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-devsu-devops01"
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default     = "vm-dev-minikube"
}

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