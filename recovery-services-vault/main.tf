locals {
  tags = {
    Environment = "devtest"
    Owner       = "cloud_team"
  }

  primary_location = "eastus2"

}

module "resource_group" {
  source = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group?ref=v1.0"

  //Resource Group
  location = "centralus"
  name     = "rg-backupdr-dt"
  tags     = local.tags
}

module "recovery_services_vault" {
  source = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//recovery-services-vault?ref=v1.0"

  rsv_name                     = "rsv-01"
  secondary_location           = module.resource_group.region
  primary_location             = local.primary_location
  rsv_rg_name                  = module.resource_group.rg_name
  tags                         = local.tags
  enable_resource_lock         = false
  environment_primary_region   = join("-", [element(split("-", module.resource_group.rg_name), 3), local.primary_location])
  environment_secondary_region = join("-", [element(split("-", module.resource_group.rg_name), 3), module.resource_group.region])
}

