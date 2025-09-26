provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_log_analytics_workspace" "default" {
  count               = var.log_analytics_workspace_id == "" ? 1 : 0
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = coalesce(var.log_analytics_resource_group_name, var.resource_group_name)
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_container_app_environment" "this" {
  name                     = var.environment_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id != "" ? var.log_analytics_workspace_id : azurerm_log_analytics_workspace.default[0].id
  tags                     = var.tags
}
