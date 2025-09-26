variable "namespace_name" {
  description = "The name of the Service Bus namespace."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "sku" {
  description = "The SKU for the Service Bus namespace."
  type        = string
  default     = "Standard"
}

variable "topic_name" {
  description = "The name of the Service Bus topic."
  type        = string
}

variable "subscription_name" {
  description = "The name of the Service Bus subscription."
  type        = string
}

variable "max_delivery_count" {
  description = "Maximum number of deliveries before dead-lettering."
  type        = number
  default     = 10
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}
