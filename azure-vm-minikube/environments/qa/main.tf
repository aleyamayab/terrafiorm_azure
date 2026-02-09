module "rg" {
  source   = "../../modules/resource-group"
  name     = "rg-devsu-qa"
  location = var.location
}

module "network" {
  source      = "../../modules/network"
  rg_name     = module.rg.name
  location    = var.location
  vnet_name   = "vnet-qa"
  subnet_name = "snet-qa"
  vnet_cidr   = "10.20.0.0/16"
  subnet_cidr = "10.20.1.0/24"
}

module "nsg" {
  source     = "../../modules/nsg"
  name       = "nsg-qa"
  rg_name    = module.rg.name
  location   = var.location
  allowed_ip = var.allowed_ip
}

module "vm" {
  source         = "../../modules/vm"
  name           = "vm-qa-minikube"
  rg_name        = module.rg.name
  location       = var.location
  subnet_id      = module.network.subnet_id
  nsg_id         = module.nsg.id
  admin_password = var.admin_password
  admin_user     = var.admin_user
}
