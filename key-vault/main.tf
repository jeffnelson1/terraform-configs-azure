locals {
  tags = {
    Environment = "devtest"
    Owner       = "cloud_team"
  }
}

module "resource_group" {
  source = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group?ref=v1.0"

  //Resource Group
  location = "eastus2"
  name     = "rg-keyvault-dt"
  tags     = local.tags
}

module "key_vault" {
  source                          = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//key-vault?ref=v1.0"
  kv_name                         = "kv-01"
  enable_resource_lock            = true
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = false
  enabled_for_template_deployment = false
  network_acl_default_action      = "Deny"
  allowed_subnet_ids = [module.azure_vm.subnet_id,
  "/subscriptions/00/*/subnet-01"]
  private_endpoint_subnet_id = module.azure_vm.subnet_id
  location                   = module.resource_group.region
  kv_rg_name                 = module.resource_group.rg_name
  tags                       = local.tags

  enable_access_assignment_1 = true
  object_id_1                = "0000"
  key_permissions_1          = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "Decrypt", "Encrypt"]
  secret_permissions_1       = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]

  enable_access_assignment_2 = true
  object_id_2                = "0001"
  key_permissions_2          = ["Get", "List", "Backup"]
  secret_permissions_2       = ["Get", "List", "Backup"]

  enable_access_assignment_3 = false
  object_id_3                = "0002"
  key_permissions_3          = ["Get"]
  secret_permissions_3       = ["Get"]
}