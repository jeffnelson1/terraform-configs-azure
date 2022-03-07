# Key Vault Terraform Configuration

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
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//key-vault | v1.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group | v1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Local Administrator Password | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Local Administrator Username | `string` | n/a | yes |
| <a name="input_datadog_apikey"></a> [datadog\_apikey](#input\_datadog\_apikey) | API for the Datadog VM extension | `string` | n/a | yes |
| <a name="input_domain_join_pass"></a> [domain\_join\_pass](#input\_domain\_join\_pass) | Password for joining VM to the specified domain. | `string` | n/a | yes |
| <a name="input_domain_join_userid"></a> [domain\_join\_userid](#input\_domain\_join\_userid) | AD User ID for joining VM to the specified domain. | `string` | n/a | yes |
| <a name="input_sa_key"></a> [sa\_key](#input\_sa\_key) | Key for storage account where the post deployment script resides | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asr_policy"></a> [asr\_policy](#output\_asr\_policy) | What ASR policy will be used. |
| <a name="output_enable_asr"></a> [enable\_asr](#output\_enable\_asr) | Enable Azure Site Recovery.  True or False. |
| <a name="output_keyvault_resource_id"></a> [keyvault\_resource\_id](#output\_keyvault\_resource\_id) | The resource ID of the Key Vault. |
| <a name="output_vault_uri"></a> [vault\_uri](#output\_vault\_uri) | URI of the Key Vault. |
| <a name="output_vm_resource_id"></a> [vm\_resource\_id](#output\_vm\_resource\_id) | The resource ID of the VM. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->