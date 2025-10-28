# 🏗️ Azure Container Apps Terraform Infrastructure

This repository contains the **infrastructure code** used during the *School of Software Engineering (Endava, 2025)* training program final lab.  

It was designed to consume a custom Terraform module that deployed containerized applications into a shared **Azure Container Apps Environment**.

> ⚙️ **Note:**  
> This environment and all Azure resources were part of a temporary training lab and therefore no longer exist.
> However, the repository remains a valuable example of how to structure and automate deployments using Terraform in a real-world Azure setup.

<br>

## 🌐 Purpose

The goal of this repository was to practice **Infrastructure as Code (IaC)** concepts, modular design with Terraform, and CI/CD workflows for deploying microservices in Azure.

Each team:
- Created its own **Terraform module** to deploy a Container App (see the [Terraform module - GitHub](https://github.com/codenamecoffee/Azure_Container_Apps_Terraform_Module)).
- Referenced that module from this infrastructure repository.
- Deployed the app into a shared **Azure Container Apps Environment**.

<br>

## 🧩 What Was Already Provisioned (Shared Lab Resources)

- **Azure Container Apps Environment** (consumption-based, public)
- **Azure Resource Group** (shared across teams)
- **Azure Container Registry (ACR)** — hosting pre-built Docker images

All teams used these shared resources to test Terraform workflows and CI/CD integrations.

<br>

## ⚙️ Workflow (Original Lab Process)

1. Create a branch:  feature/<team-name>
2. Reference your Terraform module from its own repository using the `source` URL (do not copy module files locally).  
3. Configure required variables such as image name, resource group, and environment ID.  
4. Open a **Pull Request** and add **Gonzalo Rodríguez (Endava)** as reviewer.  
5. The Azure DevOps pipeline:
- Ran `terraform plan` on PR creation.
- Ran `terraform apply` on merge to `main`.

<br>

## 🧱 Repository Structure

```
.
├── azure-pipelines.yml # CI/CD pipeline (plan + apply stages)
├── env/
│ └── dev.tfvars # Example environment variables for development
├── infra/
│ ├── main.tf # Root module entry point
│ ├── acr.tf # Azure Container Registry reference
│ ├── container_environment.tf # Container Apps Environment config
│ ├── storage_account.tf # Storage configuration
│ ├── variables.tf # Input variable definitions
│ └── mg-fg.tf # Module call (example usage)
└── README.md
```
<br>

## 🔗 Related Repository

This infrastructure used a custom Terraform module developed for this lab:  
👉 [Azure_Container_Apps_Terraform_Module](https://github.com/codenamecoffee/Azure_Container_Apps_Terraform_Module)

That module handled:
- Container App creation
- Blob storage provisioning
- Health probe configuration
- Networking and ingress setup

<br>

## 👥 Authors

- **Federico González** ([codenamecoffee](https://github.com/codenamecoffee))
- **Mariana Guerra** ([MarianaGuerraC](https://github.com/MarianaGuerraC))

<br>

## 🪪 License

This project is released under the [MIT License](LICENSE).

<br>

## 🎓 Educational Context

This repository was developed as part of the *School of Software Engineering – Endava (2025)*.  
It demonstrates:
- The use of Terraform for modular cloud automation  
- CI/CD pipelines for infrastructure management  
- Azure resource orchestration in a shared environment  

While no longer functional, it remains a practical learning artifact for DevOps and Cloud Infrastructure concepts.
