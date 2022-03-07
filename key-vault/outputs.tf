output "vm_resource_id" {
  value       = module.azure_vm.vm_resource_id
  description = "The resource ID of the VM."
}

output "keyvault_resource_id" {
  value       = module.key_vault.keyvault_resource_id
  description = "The resource ID of the Key Vault."
}

output "vault_uri" {
  value       = module.key_vault.vault_uri
  description = "URI of the Key Vault."
}

output "enable_asr" {
  value       = local.enable_asr
  description = "Enable Azure Site Recovery.  True or False."
}

output "asr_policy" {
  value       = local.asr_policy
  description = "What ASR policy will be used."
}