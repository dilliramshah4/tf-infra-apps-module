variable "name" {
  description = "Name of the Container App Job"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "environment_id" {
  description = "Container App Environment ID"
  type        = string
}

variable "timeout" {
  description = "Job timeout in seconds"
  type        = number
  default     = 300
}

variable "retry_limit" {
  description = "Retry limit for failed replicas"
  type        = number
  default     = 5
}

variable "parallelism" {
  description = "Number of parallel replicas"
  type        = number
  default     = 1
}

variable "completion_count" {
  description = "Required completion count"
  type        = number
  default     = 1
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = "main-container"
}

variable "image_name" {
  description = "Container image name"
  type        = string
}

variable "image_tag" {
  description = "Container image tag"
  type        = string
  default     = "latest"
}

variable "cpu" {
  description = "CPU allocation"
  type        = number
  default     = 0.5
}

variable "memory" {
  description = "Memory allocation"
  type        = string
  default     = "1Gi"
}

variable "acr_server" {
  description = "ACR server URL"
  type        = string
}

variable "acr_id" {
  description = "ACR resource ID"
  type        = string
}

variable "identity_id" {
  description = "User-assigned identity ID"
  type        = string
}

variable "identity_principal_id" {
  description = "Principal ID of the identity"
  type        = string
}