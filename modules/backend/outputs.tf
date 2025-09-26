output "backend_name" {
  value = azurerm_container_app.backend_app.name
}

output "backend_fqdn" {
  value = azurerm_container_app.backend_app.latest_revision_fqdn
  description = "This will be null if ingress is not enabled"
}
