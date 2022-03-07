locals {
  tags = {
    Environment = "devtest"
    Owner       = "cloud_team"
  }

  vm_names = ["webserver-01"]

}

module "resource_group" {
  source = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group?ref=v1.0"

  //Resource Group
  location = "eastus2"
  name     = "rg-linuxvm-dt"
  tags     = local.tags
}

module "azure_vm" {
  source   = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//vm-linux?ref=v1.0"
  location = module.resource_group.region

  //Virtual Machine
  vm_names             = local.vm_names
  vm_zone              = ["1"]
  patch_group          = ["Group1"]
  tags                 = local.tags
  vm_rg_name           = module.resource_group.rg_name
  vm_size              = "Standard_B2ms"
  os_disk_type         = "Premium_LRS"
  os_publisher         = "Canonical"
  os_offer             = "0001-com-ubuntu-server-focal"
  os_sku               = "20_04-lts"
  os_version           = "latest"
  admin_username       = var.admin_username
  ssh_public_key       = var.ssh_public_key
  enable_resource_lock = true

  //Network
  environment = join("-", [element(split("-", module.resource_group.rg_name), 2), module.resource_group.region])
  subnet_name = "app"

  //Extensions
  sa_key = var.sa_key
}