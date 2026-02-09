module "rg" {
  source   = "../../modules/resource-group"
  name     = "rg-devsu-demodev-westus2"
  location = var.location
}

module "vm" {
  source         = "../../modules/vm"
  name           = "vm-dev-minikube"
  rg_name        = module.rg.name
  location       = var.location
  admin_user     = var.admin_user
  admin_password = var.admin_password
}
