terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.52.0"
        }
    }
    backend "azurerm" {
      resource_group_name = "dkdemo-rg"
      storage_account_name = "storagedkdemo"
      container_name = "dktfstate"
      key = "dev.terraform.tfstate"
    }
}

provider "azurerm" {
    features {}
    subscription_id = "efe13f09-1ce2-454d-9f53-3aef9e617682"
}