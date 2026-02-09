terraform {
  backend "azurerm" {
    resource_group_name  = "rg-devsu-demo"
    storage_account_name = "statedevops1988"
    container_name       = "tfstateprod"
    key                  = "prod/minikube-vm.tfstate"
  }
}
