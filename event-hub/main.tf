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
  name     = "rg-logging-dt"
  tags     = local.tags
}

module "azure_event_hub" {
  source               = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//event-hub?ref=v1.0"
  eventhub_ns_rg_name  = module.resource_group.rg_name
  event_hub_rg_name    = module.resource_group.rg_name
  eventhub_ns_location = module.resource_group.region
  tags                 = local.tags

  event_hub_namespace_name = "ehns-01"
  eventhub_ns_sku          = "Standard"
  eventhub_ns_capacity     = "1"
  enable_resource_lock     = true

  event_hub_name              = "eh-01"
  event_hub_partition_count   = "1"
  event_hub_message_retention = "1"

  la_workspace_id = "/subscriptions/00/*/la-workspace-01"
}

