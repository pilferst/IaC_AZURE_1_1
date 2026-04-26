# =============================================================================
# outputs.tf
# All created IDs and names
# =============================================================================

output "resource_group_name" {
  description = "Name of the created Resource Group"
  value       = azurerm_resource_group.terraform_resource_group.name
}

output "resource_group_id" {
  description = "ID of the Resource Group"
  value       = azurerm_resource_group.terraform_resource_group.id
}

output "vnet1_id" {
  description = "ID of the first Virtual Network (VNet1)"
  value       = azurerm_virtual_network.vnet1.id
}

output "vnet1_name" {
  description = "Name of VNet1"
  value       = azurerm_virtual_network.vnet1.name
}

output "vnet2_id" {
  description = "ID of the second Virtual Network (VNet2)"
  value       = azurerm_virtual_network.vnet2.id
}

output "vnet2_name" {
  description = "Name of VNet2"
  value       = azurerm_virtual_network.vnet2.name
}

output "subnet1_id" {
  description = "ID of the subnet in VNet1 (vnet1_server_subnet)"
  value       = azurerm_subnet.vnet1_server_subnet.id
}

output "subnet2_id" {
  description = "ID of the subnet in VNet2 (vnet2_server_subnet)"
  value       = azurerm_subnet.vnet2_server_subnet.id
}

output "vnet_peering_vnet1_to_vnet2_id" {
  description = "ID of peering from VNet1 to VNet2"
  value       = azurerm_virtual_network_peering.peering_vnet1.id
}

output "vnet_peering_vnet2_to_vnet1_id" {
  description = "ID of peering from VNet2 to VNet1"
  value       = azurerm_virtual_network_peering.peering_vnet2.id
}

#For debagging
output "all_outputs" {
  description = "All important resource IDs in one map (convenient for copy-paste)"
  value = {
    resource_group_name = azurerm_resource_group.terraform_resource_group.name
    vnet1_id            = azurerm_virtual_network.vnet1.id
    vnet2_id            = azurerm_virtual_network.vnet2.id
    subnet1_id          = azurerm_subnet.vnet1_server_subnet.id
    subnet2_id          = azurerm_subnet.vnet2_server_subnet.id
    peering_1_to_2      = azurerm_virtual_network_peering.peering_vnet1.id
    peering_2_to_1      = azurerm_virtual_network_peering.peering_vnet2.id
  }
}