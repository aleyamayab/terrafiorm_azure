terraform {
  backend "azurerm" {
    resource_group_name  = "rg-devsu-devops01"
    storage_account_name = "statedevops01"
    container_name       = "tfstatedev"
    key                  = "dev/minikube-vm.tfstate"
  }
}
