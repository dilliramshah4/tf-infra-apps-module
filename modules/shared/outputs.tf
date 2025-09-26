output "env_id" {
  value = azurerm_container_app_environment.env.id
}

output "identity_id" {
  value = azurerm_user_assigned_identity.app_identity.id
}
