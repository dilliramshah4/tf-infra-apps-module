output "virtual_network_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.container_vnet.id
}

output "cae_infrastructure_subnet_id" {
  description = "ID of the CAE infrastructure (not delegated) subnet"
  value       = azurerm_subnet.cae_infra_subnet.id
}

output "cae_apps_subnet_id" {
  description = "ID of the CAE apps (delegated) subnet"
  value       = azurerm_subnet.cae_apps_subnet.id
}

output "cae_id" {
  description = "ID of the Container App Environment"
  value       = azurerm_container_app_environment.cae.id
}

output "cae_static_ip_address" {
  description = "Static private IP assigned to CAE"
  value       = azurerm_container_app_environment.cae.static_ip_address
}

output "cae_default_domain" {
  description = "Default public domain name for the CAE"
  value       = azurerm_container_app_environment.cae.default_domain
}

output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.example.id
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.example.name
}
