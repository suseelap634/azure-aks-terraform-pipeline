resource "azurerm_kubernetes_cluster_node_pool" "linux_pool" {
  name                  = "linuxpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  zones               = [1, 2, 3]
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
  mode                  = "User"
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb = 30
  vnet_subnet_id       = azurerm_subnet.az400_pubsub.id
  node_labels =  {
      "app"             = "java"
  }
  tags = {
    Environment = "Development"
  }
}