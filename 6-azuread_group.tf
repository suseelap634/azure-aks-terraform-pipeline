resource "azuread_group" "aks_admins" {
  display_name = "${azurerm_resource_group.rg_name.name}-aksadmin"
  #name = "${azurerm_resource_group.rg_name.name}-aksadmin"
  #mail_enabled     = true
  security_enabled = true
  #types            = ["Unified"]

}