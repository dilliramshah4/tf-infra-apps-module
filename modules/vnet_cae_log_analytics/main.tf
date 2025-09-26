provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_virtual_network" "container_vnet" {
  name                = var.vnet_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "cae_infra_subnet" {
  name                 = "${var.subnet_name}-infra"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.container_vnet.name
  address_prefixes     = var.infra_subnet_address_prefix
}

resource "azurerm_subnet" "cae_apps_subnet" {
  name                 = "${var.subnet_name}-apps"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.container_vnet.name
  address_prefixes     = var.apps_subnet_address_prefix

  delegation {
    name = "Microsoft.App.environments"
    service_delegation {
      name    = "Microsoft.App/environments"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_container_app_environment" "cae" {
  name                     = var.cae_name
  location                 = var.resource_group_location
  resource_group_name      = var.resource_group_name
  infrastructure_subnet_id = azurerm_subnet.cae_infra_subnet.id
  # Public by default (don't set internal_load_balancer_enabled)
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    environment = "dev"
  }
}
