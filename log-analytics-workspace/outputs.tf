output "workspace_id_nsg_logs" {
  value = module.log_analytics_workspace.workspace_id
}

output "storage_account_resource_id" {
  value = module.storage_account.storage_account_resource_id
}

output "workspace_id_virtual_machine" {
  value = module.log_analytics_workspace_virtual_machine.workspace_id
}