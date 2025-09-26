provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}



resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name        # Use input variable for account name
  resource_group_name       = var.resource_group_name         # Use input variable for resource group name
  location                 = var.location                     # Use input variable for location
  account_tier              = var.account_tier                # Use input variable for account tier
  account_replication_type = var.account_replication_type

  tags = var.tags  # Tags (optional)
}
