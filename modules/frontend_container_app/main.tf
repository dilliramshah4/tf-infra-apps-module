provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Data source to get the existing Container App Environment in the specified resource group
data "azurerm_container_app_environment" "existing_cae" {
  name                = var.cae_name
  resource_group_name = var.cae_resource_group
}

# Container App resource (can be deployed to a different resource group)
resource "azurerm_container_app" "app" {
  name                         = var.container_app_name
  container_app_environment_id = data.azurerm_container_app_environment.existing_cae.id
  resource_group_name          = var.container_app_resource_group
  revision_mode                = "Single"

  registry {
    server               = "${var.container_registry_name}.azurecr.io"
    username             = var.acr_username
    password_secret_name = "acr-password"
  }

  secret {
    name  = "acr-password"
    value = var.acr_password
  }

  template {
    container {
      name   = var.container_name
      image  = var.container_app_image
      cpu    = 0.25
      memory = "0.5Gi"
    }
    min_replicas = 1
    max_replicas = 1
  }

  ingress {
    external_enabled = true
    target_port      = var.target_port
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}


