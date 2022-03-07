# Log Analytics Workspace Terraform Configuration

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 14.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =2.56.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_log_analytics_workspace"></a> [log\_analytics\_workspace](#module\_log\_analytics\_workspace) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//log-analytics-workspace | v1.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group | v1.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.azuread](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_resource_id"></a> [storage\_account\_resource\_id](#output\_storage\_account\_resource\_id) | n/a |
| <a name="output_workspace_id_nsg_logs"></a> [workspace\_id\_nsg\_logs](#output\_workspace\_id\_nsg\_logs) | n/a |
| <a name="output_workspace_id_virtual_machine"></a> [workspace\_id\_virtual\_machine](#output\_workspace\_id\_virtual\_machine) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->