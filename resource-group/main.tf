// Set Tags
locals {
  tags = {
    Environment = "devtest"
    Owner       = "cloud_team"
  }

}

// Create resource group for enterprise logging
module "resource_group" {
  source   = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group?ref=v1.0"
  location = "eastus2"
  name     = "rg-app1-dt"
  tags     = local.tags
}