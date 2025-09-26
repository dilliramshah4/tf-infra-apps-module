variable "registry_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sku" {
  description = "SKU of the ACR (Basic, Standard, Premium)"
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Enable admin access"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for ACR"
  type        = map(string)
  default     = {}
}
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "registry_sku" {
  description = "SKU tier for Azure Container Registry"
  type        = string
  default     = "Standard"  # You can set your preferred default here
}
