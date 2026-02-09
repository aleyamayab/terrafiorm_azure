module "rg" {
  source   = "../../modules/resource-group"
  name     = "rg-dev-aks"
  location = var.location
  tags     = var.tags
}

module "network" {
  source       = "../../modules/network"
  rg_name      = module.rg.name
  location     = module.rg.location
  vnet_name    = "vnet-dev-aks"
  vnet_cidr    = "10.20.0.0/16"
  subnet_name  = "snet-aks"
  subnet_cidr  = "10.20.1.0/24"
  tags         = var.tags
}

module "aks" {
  source              = "../../modules/aks"
  rg_name             = module.rg.name
  location            = module.rg.location
  cluster_name        = "aks-dev-lab"
  dns_prefix          = "aksdevlab"
  subnet_id           = module.network.subnet_id
  node_count          = 1
  min_count           = 1
  max_count           = 3
  vm_size             = "standard_b2ps_v2"
  tags                = var.tags
}
