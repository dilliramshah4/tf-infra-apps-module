variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {}
variable "storage_account_name" {}
variable "account_tier" { default = "Standard" }
variable "account_replication_type" { default = "LRS" }

variable "registry_name" {}
variable "acr_sku" { default = "Basic" }
variable "acr_admin_enabled" { default = true }




variable "key_vault_name" {}
variable "key_vault_secrets" {
  type = map(string)
}

variable "vnet_name" {}
variable "vnet_address_space" {
  type = list(string)
}
variable "vnet_subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "service_bus_namespace" {}
variable "service_bus_topic" {}
variable "service_bus_subscription" {}
variable "service_bus_sku" {}
variable "max_delivery_count" { default = 10 }





variable "project_name" {}
variable "environment_name" {}

variable "acr_id" {}
variable "acr_server" {}
variable "frontend_image" {}
variable "backend_image" {}
variable "container_app_name" {
  description = "Name of the container app"
}

variable "container_app_env" {
  description = "Name of the container app environment"
}

variable "target_port" {
  description = "Port on which the container app listens"
  type        = number
}


variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}










variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "myjob"
}



variable "image_name" {
  description = "Container image name"
  type        = string
  default     = "my-app"
}

variable "image_tag" {
  description = "Container image tag"
  type        = string
  default     = "latest"
}
