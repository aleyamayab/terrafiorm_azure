# Workflows de GitHub Actions

Este repositorio incluye un workflow para ejecutar Terraform en varios entornos. El objetivo es validar, planear y aplicar o destruir infraestructura en Azure para el stack de AKS.

## Workflow disponible

Archivo: `.github/workflows/terraform-multi-env.yml`

### Cuando se ejecuta

- Manualmente con `workflow_dispatch`.

### Inputs

- `environment`: entorno objetivo. Opciones: `dev`, `qa`, `prod`.
- `action`: accion de Terraform. Opciones: `apply` o `destroy`.

### Directorio de trabajo

El workflow usa esta ruta segun el entorno seleccionado:

- `aks/environments/${environment}`

Esto significa que el workflow aplica solo al stack de AKS.

## Jobs y flujo

1) **Validate**
- Clona el repo.
- Instala Terraform 1.6.0.
- Hace login en Azure usando `AZURE_CREDENTIALS`.
- Exporta variables ARM desde el JSON del service principal.
- Ejecuta `terraform init`, `terraform validate` y `terraform fmt -check -recursive`.

2) **Plan**
- Corre despues de `validate`.
- Hace login y `terraform init`.
- Ejecuta `terraform plan` o `terraform plan -destroy` segun `action`.
- Sube el plan como artifact con nombre `tfplan-${environment}`.

3) **Execute**
- Corre despues de `validate` y `plan`.
- Descarga el artifact del plan.
- Ejecuta `terraform apply -auto-approve tfplan`.
- Si `action=destroy`, el plan ya es de destruccion.

4) **Outputs**
- Solo corre si `action=apply`.
- Ejecuta `terraform output` para mostrar outputs.

## Secret requerido

- `AZURE_CREDENTIALS`: JSON con credenciales de service principal en formato Azure CLI. Debe incluir:
  - `clientId`
  - `clientSecret`
  - `subscriptionId`
  - `tenantId`

## Recomendaciones

- Define `environment` en GitHub para `dev`, `qa`, `prod` si quieres controles de aprobacion.
- Revisa el backend remoto en `aks/environments/<env>/backend.tf` antes de aplicar.
- Para extender el workflow a otros stacks, cambia `WORKING_DIR` o crea otro workflow.

## Ejemplo de ejecucion

1) Abre Actions en GitHub.
2) Selecciona "Terraform Multi-Environment".
3) Click en "Run workflow".
4) Elige `environment` y `action`.
