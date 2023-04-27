# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.53.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = "c989d764-e476-48f3-a67b-95a7f09c8ee6"
  features {}
}

provider "azurerm" {
  alias           = "management"
  subscription_id = "68be2809-9674-447c-a43d-261ef2862c29"
  features {}
}