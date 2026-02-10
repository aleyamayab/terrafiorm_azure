# Ejemplos de Terraform en Azure

Este repositorio contiene dos stacks de Terraform para Azure:

- AKS (Kubernetes administrado) con su propia VNet y subnet.
- VM Windows para ejecutar Minikube, con red, NSG e IP publica.

Ambos stacks usan modulos y un entorno dev con backend remoto en Azure Storage.

## Requisitos

- Terraform >= 1.6.0
- Suscripcion de Azure
- Azure CLI autenticado o credenciales de un service principal exportadas para el provider

## Estructura del repositorio

- aks/
  - environments/dev: configuracion del entorno y backend
  - modules: modulos reutilizables para resource group, red y AKS
- azure-vm-minikube/
  - environments/dev: configuracion del entorno y backend
  - modules: modulos reutilizables para resource group, red, NSG y VM

## Stack 1: AKS

### Que se esta creando.

- Resource group
- Red virtual y subnet
- Cluster AKS con node pool de sistema y autoscaling

### Configuracion clave

- Backend: estado remoto azurerm en un storage account
- Region: definida por `location`
- Tags: etiquetas comunes en `terraform.tfvars`

### Archivos del entorno dev
- backend.tf: configuracion del estado remoto
- provider.tf: provider y version
- main.tf: conexion de modulos
- variables.tf: variables de entrada
- outputs.tf: outputs expuestos
- terraform.tfvars: valores dev

### Ejecucion (dev)

```
cd aks/environments/dev
terraform init
terraform plan
terraform apply
```

### Outputs

- Nombre del resource group
- Nombre del cluster AKS
- Kubeconfig de AKS (sensitive)
- ID de la subnet de AKS

## Stack 2: VM Windows para Minikube

### Que crea

- Resource group
- Red virtual y subnet
- Network security group con reglas RDP y WinRM
- VM Windows con IP publica

### Configuracion clave

- Backend: estado remoto azurerm en un storage account
- Region: definida por `location`
- Reglas NSG permiten RDP (3389) y WinRM (5985-5986) desde `allowed_ip`

### Inputs requeridos

Define estos valores antes de aplicar:

- `admin_user`
- `admin_password` (sensitive)
- `allowed_ip`

Puedes definirlos con un archivo `terraform.tfvars` en la carpeta del entorno o pasarlos con `-var`.

### Ejecucion (dev)

```
cd azure-vm-minikube/environments/dev
terraform init
terraform plan -var "admin_user=YOUR_USER" -var "admin_password=YOUR_PASSWORD" -var "allowed_ip=YOUR_IP"
terraform apply -var "admin_user=YOUR_USER" -var "admin_password=YOUR_PASSWORD" -var "allowed_ip=YOUR_IP"
```

### Outputs

- IP publica de la VM
- Nombre del resource group
- Nombre de la VM

## Estado remoto

Ambos stacks usan un backend azurerm configurado con:

- Resource group: rg-devsu-devops01
- Storage account: statedevops01
- Container: tfstatedev
- Keys: dev/aks.tfstate y dev/minikube-vm.tfstate

Asegura que el storage account y el container existen y que tus credenciales tienen acceso.

## Notas de seguridad

- No subas credenciales reales.
- Restringe `allowed_ip` a tu IP publica.
- El kubeconfig esta marcado como sensitive, pero igual se guarda en el estado.

## Limpieza

Para eliminar recursos, ejecuta `terraform destroy` en la carpeta del entorno correspondiente.
