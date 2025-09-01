terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
  # Backend remoto: parámetros se pasan por -backend-config en la pipeline
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

# === Demo simple: Resource Group + Storage Account (no es el backend) ===

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

