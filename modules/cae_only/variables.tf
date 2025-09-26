variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "environment_name" {
  type        = string
  description = "Name of the Container App Environment"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for all resources"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics Workspace Resource ID (if not provided, will create new)"
  default     = ""
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of Log Analytics Workspace to create if no workspace ID provided"
  default     = "default-log-workspace"
}

variable "log_analytics_resource_group_name" {
  type        = string
  description = "Resource group for Log Analytics Workspace if different from container environment"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags for resources"
  default     = {}
}
