resource "azurerm_container_app" "frontend_app" {
  name                         = "${var.project_name}-frontend"
  container_app_environment_id = var.env_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  registry {
    server   = var.acr_server
    identity = var.identity_id
  }

  template {
    container {
      name   = "frontend"
      image  = "${var.acr_server}/${var.acr_image}"
      cpu    = 0.5
      memory = "1.0Gi"
    }

    min_replicas = 1
    max_replicas = 2
  }

  ingress {
    external_enabled = true
    target_port      = 3000

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}
