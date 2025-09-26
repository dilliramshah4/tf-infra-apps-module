variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Azure region"
  type        = string
}

variable "key_vault_name" {
  description = "Globally unique Key Vault name (3-24 chars; no - at start/end)"
  type        = string
}
