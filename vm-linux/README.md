# Linux VM Terraform Configuration

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
| <a name="module_azure_vm"></a> [azure\_vm](#module\_azure\_vm) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//vm-linux | v1.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group | v1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Local Administrator Username | `string` | n/a | yes |
| <a name="input_sa_key"></a> [sa\_key](#input\_sa\_key) | Key for storage account where the post deployment script resides | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH Public Key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_resource_id"></a> [vm\_resource\_id](#output\_vm\_resource\_id) | The resource ID of the VM. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->