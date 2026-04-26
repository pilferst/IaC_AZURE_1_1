resource "azurerm_resource_group" "terraform_resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location_main
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1_name
  resource_group_name = azurerm_resource_group.terraform_resource_group.name
  location = var.vnet_location
  address_space = var.vnet1_address_space
  depends_on = [ 
    azurerm_resource_group.terraform_resource_group
     ]
}


resource "azurerm_virtual_network" "vnet2" {
  name                = var.vnet2_name
  resource_group_name = azurerm_resource_group.terraform_resource_group.name
  location = var.vnet_location
  address_space = var.vnet2_address_space
  depends_on = [ 
    azurerm_resource_group.terraform_resource_group
     ]
}

resource "azurerm_virtual_network_peering" "peering_vnet1" {
  name                      = "vnet1to2"
  resource_group_name       = azurerm_resource_group.terraform_resource_group.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
  depends_on = [ azurerm_resource_group.terraform_resource_group,
  azurerm_virtual_network.vnet1,
  azurerm_virtual_network.vnet2 ]
}

resource "azurerm_virtual_network_peering" "peering_vnet2" {
  name                      = "vnet2to1"
  resource_group_name       = azurerm_resource_group.terraform_resource_group.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
  depends_on = [ azurerm_resource_group.terraform_resource_group,
  azurerm_virtual_network.vnet1,
  azurerm_virtual_network.vnet2 ]
}


resource "azurerm_subnet" "vnet1_server_subnet" {
  name                 = var.vnet1_subnet1_name
  resource_group_name  = azurerm_resource_group.terraform_resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.vnet1_subnet1_ip_prefix
  depends_on = [ azurerm_resource_group.terraform_resource_group,
  azurerm_virtual_network.vnet1,
  azurerm_virtual_network.vnet2,
  azurerm_virtual_network_peering.peering_vnet1,
  azurerm_virtual_network_peering.peering_vnet2 ]
  }


resource "azurerm_subnet" "vnet2_server_subnet" {
  name                 = var.vnet2_subnet1_name
  resource_group_name  = azurerm_resource_group.terraform_resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = var.vnet2_subnet1_ip_prefix
  depends_on = [ azurerm_resource_group.terraform_resource_group,
  azurerm_virtual_network.vnet1,
  azurerm_virtual_network.vnet2,
  azurerm_virtual_network_peering.peering_vnet1,
  azurerm_virtual_network_peering.peering_vnet2  ]
  }
  