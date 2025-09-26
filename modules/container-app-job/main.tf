resource "azurerm_container_app_job" "this" {
  name                         = var.name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.environment_id

  replica_timeout_in_seconds = var.timeout
  replica_retry_limit        = var.retry_limit

  manual_trigger_config {
    parallelism              = var.parallelism
    replica_completion_count = var.completion_count
  }

  template {
    container {
      name   = var.container_name
      image  = "${var.acr_server}/${var.image_name}:${var.image_tag}"
      cpu    = var.cpu
      memory = var.memory
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  registry {
    server   = var.acr_server
    identity = var.identity_id
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = var.identity_principal_id
}