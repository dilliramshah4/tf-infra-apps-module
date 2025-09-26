provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                        = var.key_vault_name
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete",
      "Recover", "Backup", "Restore", "GetRotationPolicy",
      "SetRotationPolicy", "Rotate"
    ]
    secret_permissions = [
      "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"
    ]
    certificate_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete",
      "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers",
      "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"
    ]
  }

  soft_delete_retention_days      = 90
  purge_protection_enabled        = true
  enabled_for_deployment          = false
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  enable_rbac_authorization       = false

  tags = {
    environment = "dev"
  }
}
