output "vm_public_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.this.name
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.this.id
}
