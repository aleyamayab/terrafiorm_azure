variable "location" { 
  default = "westus" 
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-k8s-dev"
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default     = "vm-k8s-minikube"
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