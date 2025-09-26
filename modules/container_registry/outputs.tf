output "container_registry_name" {
  description = "The name of the Azure Container Registry"
  value       = azurerm_container_registry.example.name
}

output "container_registry_login_server" {
  description = "The login server URL for the Azure Container Registry"
  value       = azurerm_container_registry.example.login_server
}

