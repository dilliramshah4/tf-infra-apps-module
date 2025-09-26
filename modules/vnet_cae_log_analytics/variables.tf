variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "resource_group_location" {
  description = "Azure region to deploy resources into"
  type        = string
}

variable "vnet_name" {
  description = "Name for the Azure Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name prefix (will suffix -infra and -apps)"
  type        = string
}

variable "cae_name" {
  description = "Name for the Azure Container App Environment"
  type        = string
}

variable "log_analytics_name" {
  description = "Name for the Log Analytics Workspace"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.100.0.0/16"]
}

variable "infra_subnet_address_prefix" {
  description = "Address prefix for the infra subnet"
  type        = list(string)
  default     = ["10.100.0.0/23"]
}

variable "apps_subnet_address_prefix" {
  description = "Address prefix for the apps subnet"
  type        = list(string)
  default     = ["10.100.2.0/23"]
}
