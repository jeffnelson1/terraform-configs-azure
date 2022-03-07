## Call resource group module
module "resource_group" {
  source   = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group?ref=v1.0"
  location = "eastus2"
  name     = "rg-storage-dt"
  tags     = var.tags

}

## Call storage account module
module "storage_account" {
  source               = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//storage-account?ref=v1.0"
  storage_account_name = "storageaccount00044343"
  rg_name              = module.resource_group.rg_name
  location             = module.resource_group.region
  account_tier         = "Standard"
  replication_type     = "GRS"
  account_kind         = "StorageV2"
  access_tier          = "Hot"
  tags                 = var.tags
  enable_resource_lock = true ## 'true' will enable a deleteOnlyLock and 'false' will disable a deleteOnlyLock
}