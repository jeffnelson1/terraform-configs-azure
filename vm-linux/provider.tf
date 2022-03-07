terraform {
  required_version = ">= 14.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.56.0"
    }
  }
}
provider "azurerm" {
  features {}
}