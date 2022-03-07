terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "staccount"
    container_name       = "tfstate"
    key                  = "key-vault"
  }
}