output "key_vault_id" {
  value       = azurerm_key_vault.example.id
  description = "ID of Azure Key Vault"
}

output "key_vault_name" {
  value       = azurerm_key_vault.example.name
  description = "Azure Key Vault Name"
}

output "key_vault_uri" {
  value       = azurerm_key_vault.example.vault_uri
  description = "DNS URI of Azure Key Vault"
}
