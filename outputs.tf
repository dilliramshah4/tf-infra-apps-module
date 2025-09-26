 # output for the storage account
output "storage_account_id" {
  value = module.storage_account.storage_account_id  # Referencing the output from the child module
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name  # Referencing the output from the child module
}


output "container_registry_name" {
  value       = module.container_registry.container_registry_name
  description = "The name of the Azure Container Registry"
}

output "container_registry_login_server" {
  value       = module.container_registry.container_registry_login_server
  description = "The login server URL for the Azure Container Registry"
}



output "key_vault_uri" {
  description = "URI of the created Key Vault"
  value       = module.key_vault.key_vault_uri
}


output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_ids" {
  value = module.vnet.subnet_ids
}


output "service_bus_topic_id" {
  value = module.service_bus.topic_id
}



output "frontend_app_name" {
  value = module.frontend.frontend_name
}

output "frontend_app_url" {
  value = "https://${module.frontend.frontend_fqdn}"
}

output "backend_app_name" {
  value = module.backend.backend_name
}

output "backend_app_fqdn" {
  value = module.backend.backend_fqdn
  description = "Null unless ingress is enabled for backend"
}

output "environment_id" {
  value = module.shared.env_id
}

output "identity_id" {
  value = module.shared.identity_id
}






