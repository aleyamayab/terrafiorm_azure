module "rg" {
  source   = "../../modules/resource-group"
  name     = "rg-devsu-demodev"
  location = var.location
}

module "network" {
  source      = "../../modules/network"
  rg_name     = module.rg.name
  location    = var.location
  vnet_name   = "vnet-dev"
  subnet_name = "snet-dev"
  vnet_cidr   = "10.10.0.0/16"
  subnet_cidr = "10.10.1.0/24"
}

module "nsg" {
  source     = "../../modules/nsg"
  name       = "nsg-dev"
  rg_name    = module.rg.name
  location   = var.location
  allowed_ip = var.allowed_ip
}

module "vm" {
  source         = "../../modules/vm"
  name           = "vm-dev-minikube"
  rg_name        = module.rg.name
  location       = var.location
  subnet_id      = module.network.subnet_id
  nsg_id         = module.nsg.id
  admin_user     = var.admin_user
  admin_password = var.admin_password
}
