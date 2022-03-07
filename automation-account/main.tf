locals {
  tags = {
    Environment = "devtest"
    Owner       = "cloud_team"
  }

}

module "resource_group" {
  source = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group?ref=v1.0"

  //Resource Group
  location = "centralus"
  name     = "rg-automation-dt"
  tags     = local.tags
}

module "automation_account" {
  source = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//automation-account?ref=v1.0"

  automation_account_name = "auto-account-01"
  rg_name                 = module.resource_group.rg_name
  location                = module.resource_group.region
  tags                    = local.tags
  enable_resource_lock    = false
}


