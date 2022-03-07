locals {
  tags = {
    Environment = "devtest"
    Owner       = "cloud_team"
  }

  vm_names   = ["appserver-01"]
  enable_asr = false
  asr_policy = "No ASR"
}

module "resource_group" {
  source = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group?ref=v1.0"

  //Resource Group
  location = "eastus2"
  name     = "rg-winvm-dt"
  tags     = local.tags
}

module "azure_vm" {
  source   = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//vm-windows?ref=v1.0"
  location = module.resource_group.region

  //Virtual Machine
  vm_names             = local.vm_names
  vm_zone              = ["2"]
  disk_zone            = [["2"]]
  patch_group          = ["Group2"]
  tags                 = local.tags
  vm_rg_name           = module.resource_group.rg_name
  vm_size              = "Standard_B2s"
  os_disk_type         = "Premium_LRS"
  windows_os_version   = "2019-Datacenter"
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  enable_resource_lock = true

  //Network
  environment = join("-", [element(split("-", module.resource_group.rg_name), 2), module.resource_group.region])
  subnet_name = "app"

  //Data Disk 1
  data_disk_rg_name = module.resource_group.rg_name
  data_disk_type    = "Premium_LRS"
  data_disk_size_gb = "100"

  //Data Disk 2
  create_data_disk_2    = false
  data_disk_2_size_gb   = "50"
  data_disk_2_disk_type = "Premium_LRS"

  //Data Disk 3
  create_data_disk_3    = false
  data_disk_3_size_gb   = "50"
  data_disk_3_disk_type = "Premium_LRS"

  //Extensions
  domain_join_userid = var.domain_join_userid
  domain_join_pass   = var.domain_join_pass
  datadog_api        = var.datadog_apikey
  sa_key             = var.sa_key

  // Disk Encryption
  vault_id                   = module.key_vault.keyvault_resource_id
  vault_id_secondary         = "No secondary key vault needed."
  vault_url                  = module.key_vault.vault_uri
  enable_azure_site_recovery = local.enable_asr
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
  "/subscriptions/00/*/subnets/app"]
  private_endpoint_subnet_id = module.azure_vm.subnet_id
  location                   = module.resource_group.region
  kv_rg_name                 = module.resource_group.rg_name
  tags                       = local.tags

  enable_access_assignment_1 = true
  object_id_1                = "000"
  key_permissions_1          = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "Decrypt", "Encrypt"]
  secret_permissions_1       = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]

  enable_access_assignment_2 = true
  object_id_2                = "001"
  key_permissions_2          = ["Get", "List", "Backup"]
  secret_permissions_2       = ["Get", "List", "Backup"]

  enable_access_assignment_3 = false
  object_id_3                = "002"
  key_permissions_3          = ["Get"]
  secret_permissions_3       = ["Get"]
}