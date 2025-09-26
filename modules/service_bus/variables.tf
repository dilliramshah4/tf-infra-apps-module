variable "subscription_id" {
  type        = string
  description = "The Azure Subscription ID"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the existing Azure Resource Group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the Azure Resource Group"
}

variable "servicebus_namespace_name" {
  type        = string
  description = "Name for the Service Bus Namespace (6-50 chars, start with letter)"
}

variable "servicebus_queue_name" {
  type        = string
  description = "Name for the Service Bus Queue"
}
