terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
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