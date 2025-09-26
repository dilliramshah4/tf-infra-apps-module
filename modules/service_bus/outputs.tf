output "servicebus_namespace_id" {
  value       = azurerm_servicebus_namespace.example.id
  description = "The ID of the Service Bus Namespace"
}

output "servicebus_namespace_name" {
  value       = azurerm_servicebus_namespace.example.name
  description = "The name of the Service Bus Namespace"
}

output "servicebus_queue_id" {
  value       = azurerm_servicebus_queue.example.id
  description = "The ID of the Service Bus Queue"
}

output "servicebus_queue_name" {
  value       = azurerm_servicebus_queue.example.name
  description = "The name of the Service Bus Queue"
}
