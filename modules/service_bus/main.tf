provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


# Service Bus Namespace (unchanged)
resource "azurerm_servicebus_namespace" "example" {
  name                = var.servicebus_namespace_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
}

# Queue
resource "azurerm_servicebus_queue" "example" {
  name         = var.servicebus_queue_name
  namespace_id = azurerm_servicebus_namespace.example.id
 # enable_partitioning = true
}

