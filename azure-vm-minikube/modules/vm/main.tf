resource "azurerm_windows_virtual_machine" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.size

  admin_username = var.admin_user
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-23h2-pro"
    version   = "latest"
  }

  secure_boot_enabled = true
  vtpm_enabled        = true

  enable_automatic_updates = true
  patch_mode               = "AutomaticByPlatform"
}
