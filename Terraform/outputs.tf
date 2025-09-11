output "aks_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
output "postgres_admin_password" {
  value     = random_password.pg_password.result
  sensitive = true
}
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
