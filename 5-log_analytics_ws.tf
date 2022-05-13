resource "azurerm_log_analytics_workspace" "aks_laws" {
  name                = "${random_pet.aksrandom.id}"
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}