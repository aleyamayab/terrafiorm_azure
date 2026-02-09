module "rg" {
  source   = "../../modules/resource-group"
  name     = "rg-devsu-prod"
  location = var.location
}

module "network" {
  source      = "../../modules/network"
  rg_name     = module.rg.name
  location    = var.location
  vnet_name   = "vnet-prod"
  subnet_name = "snet-prod"
  vnet_cidr   = "10.30.0.0/16"
  subnet_cidr = "10.30.1.0/24"
}

module "nsg" {
  source     = "../../modules/nsg"
  name       = "nsg-prod"
  rg_name    = module.rg.name
  location   = var.location
  allowed_ip = var.allowed_ip
}

module "vm" {
  source         = "../../modules/vm"
  name           = "vm-prod-minikube"
  rg_name        = module.rg.name
  location       = var.location
  subnet_id      = module.network.subnet_id
  nsg_id         = module.nsg.id
  admin_password = var.admin_password
  admin_user     = var.admin_user
}
