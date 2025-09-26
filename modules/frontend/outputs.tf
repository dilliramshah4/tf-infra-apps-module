output "frontend_name" {
  value = azurerm_container_app.frontend_app.name
}

output "frontend_fqdn" {
  value = azurerm_container_app.frontend_app.latest_revision_fqdn
}
