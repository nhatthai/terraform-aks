terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "containers"
    key                  = "aks.tfstate"
  }
}

provider "azurerm" {
  version = "3.0"
  features {}
}