output "container_app_id" {
  description = "ID of the deployed Azure Container App"
  value       = azurerm_container_app.app.id
}

output "container_app_name" {
  description = "Name of the deployed Azure Container App"
  value       = azurerm_container_app.app.name
}

output "container_app_fqdn" {
  description = "Fully qualified domain name (FQDN) of the Azure Container App"
  value       = azurerm_container_app.app.ingress[0].fqdn
}

output "container_app_environment_id" {
  description = "ID of the Container App Environment used"
  value       = data.azurerm_container_app_environment.existing_cae.id
}
