# Storage Account Terraform Configuration

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
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//storage-account | v1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "Environment": "devtest",<br>  "Owner": "cloud_team"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_resource_id"></a> [storage\_account\_resource\_id](#output\_storage\_account\_resource\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->