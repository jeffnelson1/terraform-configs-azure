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
  name     = "rg-laworkspace-dt"
  tags     = local.tags
}

// Create la workspace for nsg flow logs
module "log_analytics_workspace" {
  source               = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//log-analytics-workspace?ref=v1.0"
  location             = module.resource_group.region
  workspace_rg_name    = module.resource_group.rg_name
  workspace_name       = "log-01"
  retention_in_days    = 30
  enable_resource_lock = true // 'true' will enable a deleteOnlyLock and 'false' will disable a deleteOnlyLock
  tags                 = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "azuread" {
  name                           = "diaglogs-to-eh"
  target_resource_id             = module.log_analytics_workspace.workspace_id
  eventhub_authorization_rule_id = "/subscriptions/00/*/RootManageSharedAccessKey"
  eventhub_name                  = "eh-01"
  log {
    category = "Audit"
    enabled  = true
  }
}