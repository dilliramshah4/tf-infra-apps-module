variable "subscription_id" {
  description = "Azure Subscription ID."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name."
  type        = string
}

variable "resource_group_location" {
  description = "Resource Group Location."
  type        = string
}

variable "log_analytics_name" {
  description = "Log Analytics Workspace Name."
  type        = string
}

variable "cae_name" {
  description = "Container App Environment Name."
  type        = string
}

variable "container_app_job_name" {
  description = "Container App Job Name."
  type        = string
}

variable "container_job_image" {
  description = "Container Job Container Image."
  type        = string
}

variable "acr_server" {
  description = "ACR Login Server."
  type        = string
}

variable "acr_username" {
  description = "ACR Username."
  type        = string
}

variable "acr_password" {
  description = "ACR Password."
  type        = string
  sensitive   = true
}

variable "servicebus_queue_name" {
  description = "Azure Service Bus queue name to connect to"
  type        = string
}

