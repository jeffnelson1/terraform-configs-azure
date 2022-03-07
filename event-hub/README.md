# Event Hub Terraform Configuration

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
| <a name="module_azure_event_hub"></a> [azure\_event\_hub](#module\_azure\_event\_hub) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//event-hub | v1.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/jeffnelson1/terraform-modules-azure.git//resource-group | v1.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_hub_ns_resource_id"></a> [event\_hub\_ns\_resource\_id](#output\_event\_hub\_ns\_resource\_id) | The resource ID of the event hub namespace. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->