# 🚀 Terraform en Azure DevOps (Fork-Friendly)

Este proyecto es un **esqueleto** para correr Terraform en **Azure DevOps** con **state remoto en Azure Storage**.
Cada persona que haga **fork** obtiene su **propio container de state**, pero todos comparten la misma **Storage Account**.

## 📂 Estructura
```
.
├── azure-pipelines.yml     # Pipeline de Azure DevOps
├── infra/                  # Configuración Terraform
│   ├── main.tf
│   └── variables.tf
└── env/
    └── dev.tfvars
```

## ⚙️ Prerrequisitos
1. **Azure Subscription** y una **Storage Account** compartida (ej.: RG=`rg-tfstate`, SA=`stterraformstate123`).
2. **Service Connection** en Azure DevOps (ARM) con permisos para crear contenedores en la SA (RBAC: *Storage Blob Data Contributor*).
3. Crear un **Environment** en ADO (ej. `infra-dev`) para approvals si querés.

## ▶️ Cómo funciona
- La pipeline deriva un **container único por fork** desde `Build.Repository.Name`, lo normaliza (minúsculas y guiones) y crea el container si no existe.
- `terraform init` recibe **-backend-config** con: RG, SA, *container por fork* y `key` (ruta `<repo>/<env>.tfstate`).

## 🧪 Probar rápido
1. Hacé **fork** del repo.
2. En Azure DevOps, crea la pipeline apuntando a `azure-pipelines.yml`.
3. Ejecutá: la pipeline creará tu **container** y hará `plan` (en PR) y `apply` (solo `main`).

## 🔐 Buenas prácticas
- No subas `terraform.tfstate` ni `*.tfplan` al repo.
- Usa `tfvars` por entorno y mantén secrets en **Variable Groups** o **Key Vault**.
- Commitea `.terraform.lock.hcl` para fijar versiones de providers.


## 🧩 Unicidad por proyecto + repo
La pipeline deriva el **container** usando `$(System.TeamProject)-$(Build.Repository.Name)`,
lo normaliza y lo recorta a 63 chars. Así, dos repos con el mismo nombre en proyectos distintos
no comparten el mismo container de state.


### 🧹 Destroy manual
La pipeline incluye un **stage `Destroy`** que sólo corre cuando lo lanzás **manualmente** con la variable `DO_DESTROY=true`.

**Cómo usarlo en Azure DevOps:**
1. Pipelines → Run pipeline → **Variables** → agrega `DO_DESTROY=true`.
2. Ejecutá. El stage `Destroy` usará el **mismo backend** (container derivado por proyecto+repo) y hará `terraform destroy` en el `workspace` del entorno (`environmentName`).
3. El job está asociado al **Environment** especificado para que puedas requerir **aprobaciones** antes de destruir.

> Si tenés `env/dev.tfvars` (o el que corresponda), el destroy lo carga automáticamente.
