terraform {
  required_providers {
    azurerm = {
        version = ">=3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "__storageAccountResourceGroup__"
    storage_account_name = "__storageAccount__"
    container_name       = "terraform-test"
    key                  = "terraformaks.tfstate"
  }
}

provider "azurerm" {
  client_id       = var.client_id    
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  features {}
}
