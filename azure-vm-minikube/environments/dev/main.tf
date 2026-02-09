module "rg" {
  source   = "../../modules/resource-group"
  name     = var.rg_name
  location = var.location
}

module "network" {
  source   = "../../modules/network"
  name     = "vnet-dev"
  location = var.location
  rg_name  = module.rg.name

  address_space          = ["10.10.0.0/16"]
  subnet_address_prefix  = ["10.10.1.0/24"]
}

module "nsg" {
  source     = "../../modules/nsg"
  name       = "nsg-dev"
  location   = var.location
  rg_name    = module.rg.name
  allowed_ip = var.allowed_ip
}

module "vm" {
  source         = "../../modules/vm"
  name           = var.vm_name
  rg_name        = module.rg.name
  location       = var.location
  subnet_id      = module.network.subnet_id
  nsg_id         = module.nsg.nsg_id
  admin_user     = var.admin_user
  admin_password = var.admin_password
}
