data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "storage_account" {
  source                   = "./modules/storage_account"
  storage_account_name     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.this.name
  location                 = data.azurerm_resource_group.this.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}

module "container_registry" {
  source              = "./modules/container_registry"
  registry_name       = var.registry_name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}


module "key_vault" {
  source              = "./modules/key_vault"
  key_vault_name      = var.key_vault_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  secrets             = var.key_vault_secrets
  tags                = var.tags
}

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  subnets             = var.vnet_subnets
  tags                = var.tags
}

module "service_bus" {
  source              = "./modules/service_bus"
  namespace_name      = var.service_bus_namespace
  topic_name          = var.service_bus_topic
  subscription_name   = var.service_bus_subscription
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  sku                 = var.service_bus_sku
  max_delivery_count  = var.max_delivery_count
  tags                = var.tags
}



module "shared" {
  source              = "./modules/shared"
  project_name        = var.project_name
  environment_name    = var.environment_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  acr_id              = var.acr_id
}

module "frontend" {
  source              = "./modules/frontend"
  project_name        = var.project_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  acr_server          = var.acr_server
  acr_image           = var.frontend_image
  env_id              = module.shared.env_id
  identity_id         = module.shared.identity_id
}

module "backend" {
  source              = "./modules/backend"
  project_name        = var.project_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  acr_server          = var.acr_server
  acr_image           = var.backend_image
  env_id              = module.shared.env_id
  identity_id         = module.shared.identity_id
}




resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.prefix}-logs"
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  sku                 = "PerGB2018"
}

resource "azurerm_container_app_environment" "this" {
  name                       = "${var.prefix}-env"
  location                   = data.azurerm_resource_group.this.location
  resource_group_name        = data.azurerm_resource_group.this.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
}

resource "azurerm_user_assigned_identity" "this" {
  name                = "${var.prefix}-identity"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
}

module "container-app-job" {
  source = "./modules/container-app-job"

  name                = "${var.prefix}-job"
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  environment_id      = azurerm_container_app_environment.this.id

  image_name = var.image_name
  image_tag  = var.image_tag

  acr_server            = var.acr_server
  acr_id                = var.acr_id
  identity_id           = azurerm_user_assigned_identity.this.id
  identity_principal_id = azurerm_user_assigned_identity.this.principal_id
}





