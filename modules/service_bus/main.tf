resource "azurerm_servicebus_namespace" "this" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  tags = var.tags
}

resource "azurerm_servicebus_topic" "this" {
  name         = var.topic_name
  namespace_id = azurerm_servicebus_namespace.this.id
}

resource "azurerm_servicebus_subscription" "this" {
  name                = var.subscription_name
  topic_id            = azurerm_servicebus_topic.this.id
  max_delivery_count  = var.max_delivery_count
}
