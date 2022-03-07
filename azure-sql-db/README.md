# Azure SQL Database Terraform Configuration

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 14.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.56.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group | v1.0 |
| <a name="module_sql_database"></a> [sql\_database](#module\_sql\_database) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//azure-sql-db-serverless | v1.0 |
| <a name="module_sql_server"></a> [sql\_server](#module\_sql\_server) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//azure-sql-server | v1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sql_admin_name"></a> [sql\_admin\_name](#input\_sql\_admin\_name) | Username for the SQL Admin Account | `string` | n/a | yes |
| <a name="input_sql_admin_password"></a> [sql\_admin\_password](#input\_sql\_admin\_password) | Password of the SQL Admin Account | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_database_id"></a> [sql\_database\_id](#output\_sql\_database\_id) | n/a |
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->