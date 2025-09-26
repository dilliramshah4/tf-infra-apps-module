provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "existing" {
  name                = var.log_analytics_name
  resource_group_name = var.resource_group_name
}

data "azurerm_container_app_environment" "existing_cae" {
  name                = var.cae_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_container_app_job" "example" {
  name                         = var.container_app_job_name
  location                     = data.azurerm_resource_group.existing.location
  resource_group_name          = var.resource_group_name
  container_app_environment_id = data.azurerm_container_app_environment.existing_cae.id

  replica_timeout_in_seconds = 20
  replica_retry_limit        = 3

  manual_trigger_config {
    parallelism              = 2
    replica_completion_count = 1
  }

  # For image pull authentication
  registry {
    server               = var.acr_server      # e.g. drs999.azurecr.io
    username             = var.acr_username    # e.g. drs999
    password_secret_name = "acr-password"
  }

  secret {
    name  = "acr-password"
    value = var.acr_password
  }

  template {
    container {
      image = var.container_job_image
      name  = "worker-job"

      env {
        name  = "SERVICEBUS_QUEUE_NAME"
        value = var.servicebus_queue_name
      }

      cpu    = 0.5
      memory = "1Gi"
    }
  }
}
