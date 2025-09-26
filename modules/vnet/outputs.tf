output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network"
}

output "subnet_ids" {
  value = { for k, subnet in azurerm_subnet.subnets : k => subnet.id }
  description = "IDs of the subnets"
}
