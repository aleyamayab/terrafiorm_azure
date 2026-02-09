output "vm_public_ip" {
  description = "IP pública de la VM"
  value       = module.vm.vm_public_ip
}

output "resource_group_name" {
  description = "Nombre del resource group"
  value       = module.rg.name
}

output "vm_name" {
  description = "Nombre de la VM"
  value       = module.vm.vm_name
}
