provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_container_registry" "this" {
  name                = var.registry_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.registry_sku
  admin_enabled       = true
  tags                = var.tags
}
