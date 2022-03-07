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
  location = "eastus2"
  name     = "rg-sql-dt"
  tags     = local.tags
}

//Azure SQL Server
module "sql_server" {
  source               = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//azure-sql-server?ref=v1.0"
  sql_server_name      = "sqlsvr01"
  sql_server_rg_name   = module.resource_group.rg_name
  location             = module.resource_group.region
  sql_version          = "12.0"
  sql_admin_name       = var.sql_admin_name
  sql_admin_password   = var.sql_admin_password
  enable_public_access = true
  tags                 = local.tags
}

//Azure SQL Database Serverless
module "sql_database" {
  source                      = "git::https://github.com/jeffnelson1/terraform-modules-azure.git//azure-sql-db-serverless?ref=v1.0"
  sql_database_name           = "sqldb01"
  sql_server_id               = module.sql_server.sql_server_id
  auto_pause_delay_in_minutes = "-1"
  sku_name                    = "GP_S_Gen5_2"
  zone_redundant              = false
  max_size_gb                 = 100
  min_core_capacity           = ".5"
  tags                        = local.tags
}