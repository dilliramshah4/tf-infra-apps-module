resource "azurerm_container_registry" "example" {
  name                = var.registry_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                  = var.sku
  admin_enabled        = var.admin_enabled

  tags = var.tags

  
}