variable "registry_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the container registry will be created."
  type        = string
}

variable "location" {
  description = "The location/region where the container registry will be created."
  type        = string
}

variable "sku" {
  description = "The SKU of the container registry. Possible values are: Basic, Standard, Premium."
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Whether or not to enable the admin user for the container registry."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags for the container registry."
  type        = map(string)
  default     = {}
}