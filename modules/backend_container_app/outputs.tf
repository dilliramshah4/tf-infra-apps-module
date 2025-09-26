output "container_app_id" {
  description = "The Resource ID of the deployed Container App."
  value       = azurerm_container_app.app.id
}

output "container_app_fqdn" {
  description = "The FQDN of the deployed Container App."
  value       = azurerm_container_app.app.latest_revision_fqdn
}

output "container_app_environment_id" {
  description = "The Resource ID of the Container App Environment."
  value       = data.azurerm_container_app_environment.existing_cae.id
}