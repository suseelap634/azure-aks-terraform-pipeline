resource "azurerm_virtual_network" "az400-vnet" {
  name                = "${azurerm_resource_group.rg_name.name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_name.name
  address_space       = [var.address_space]

}

resource "azurerm_subnet" "az400_pubsub" {
  name                 = "${azurerm_resource_group.rg_name.name}-subnet"
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.az400-vnet.name
  address_prefixes     = [var.address_prefixes]

}