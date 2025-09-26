variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "cae_name" {
  type        = string
  description = "Container App Environment name"
}

variable "cae_resource_group" {
  type        = string
  description = "Resource group containing the Container App Environment"
}

variable "container_app_name" {
  type        = string
  description = "Name of the Container App"
}

variable "container_app_resource_group" {
  type        = string
  description = "Resource group to deploy the Container App"
}

variable "container_registry_name" {
  type        = string
  description = "Container Registry name (without domain)"
}

variable "acr_username" {
  type        = string
  description = "Container Registry username"
}

variable "acr_password" {
  type        = string
  description = "Container Registry password (secret)"
  sensitive   = true
}

variable "container_name" {
  type        = string
  description = "Container name inside the app"
}

variable "container_app_image" {
  type        = string
  description = "Container image to deploy"
}

variable "target_port" {
  type        = number
  description = "Ingress target port"
}
variable "container_registry_server" {
  description = "Container Registry server URL"
  type        = string
}

variable "resource_group_location" {
  description = "Azure region for resource group"
  type        = string
  default     = "eastus"
}
