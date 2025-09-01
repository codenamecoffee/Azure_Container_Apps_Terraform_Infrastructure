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

resource "random_string" "sfx" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "demo" {
  name                     = "st${random_string.sfx.result}${replace(var.rg_name, "/[^a-z0-9]/", "")}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  allow_blob_public_access = false

  tags = merge(var.tags, { Component = "demo-storage" })
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "storage_account_name" {
  value = azurerm_storage_account.demo.name
}
