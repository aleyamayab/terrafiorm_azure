output "resource_group_name" {
  description = "Resource Group donde vive el AKS"
  value       = module.rg.name
}

output "aks_cluster_name" {
  description = "Nombre del cluster AKS"
  value       = module.aks.cluster_name
}

output "aks_kubeconfig_raw" {
  description = "Kubeconfig del cluster (RAW)"
  value       = module.aks.kube_config
  sensitive   = true
}

output "aks_subnet_id" {
  description = "Subnet donde está desplegado AKS"
  value       = module.network.subnet_id
}
