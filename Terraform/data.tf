data "azurerm_resource_group" "rgname" {
  name = var.rg_name
}

data "azurerm_user_assigned_identity" "useridentity" {
  name = "mi-use-iact1-dev"
  resource_group_name = "RGP-USE-IACT1-DEV"
} 