variable "key_vault_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the Key Vault"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "secrets" {
  type        = map(string)
  description = "Secrets to store in the Key Vault"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate"
  default     = {}
}
