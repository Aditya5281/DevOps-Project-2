resource "azurerm_container_registry" "acr" {
  name = var.acr_name
  resource_group_name = data.azurerm_resource_group.rgname.name
  location = "East US"
  sku = "Standard"
  identity {
    type = "UserAssigned"
    identity_ids = [
      data.azurerm_user_assigned_identity.useridentity.id
    ]
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = var.aks_name
  resource_group_name = var.rg_name
  location = "East US"
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "role" {
  principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}