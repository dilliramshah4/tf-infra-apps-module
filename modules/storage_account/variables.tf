variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}


variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where the storage account will be created"
  type        = string
}

variable "account_tier" {
  description = "The performance tier of the storage account"
  type        = string
  default     = "Standard"  # Default value if not passed
}




variable "tags" {
  description = "Tags to associate with the storage account"
  type        = map(string)
  default     = {}  # Optional: Add default tags if needed
}

variable "account_replication_type" {
  description = "Replication strategy (e.g., LRS, GRS, RAGRS)"
  type        = string
  default     = "RAGRS"
}
