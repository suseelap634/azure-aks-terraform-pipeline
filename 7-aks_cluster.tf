resource "azurerm_kubernetes_cluster" "k8s" {
  name                 = "${azurerm_resource_group.rg_name.name}-cluster"
  location             = azurerm_resource_group.rg_name.location
  resource_group_name  = azurerm_resource_group.rg_name.name
  dns_prefix           = "${azurerm_resource_group.rg_name.name}-cluster"
  kubernetes_version   = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group  = "${azurerm_resource_group.rg_name.name}-nrg"
  azure_policy_enabled = true
  
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_laws.id
  }

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name            = "systempool"
    node_count      = 1
    vm_size         = "Standard_D2_v2"
    zones           = [1, 2, 3]
    os_disk_size_gb = 30
    type            = "VirtualMachineScaleSets"
    vnet_subnet_id       = azurerm_subnet.az400_pubsub.id
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "os"            = "linux"
      "apps"          = "system-app"
    }



    tags = {

      "nodepool-type" = "system"
      "Environment"   = "Development"
      "os"            = "linux"
      "apps"          = "system-app"


    }

  }

  identity {
    type = "SystemAssigned"
  }

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [azuread_group.aks_admins.id]
  }

  /*
  azure_policy_enabled
  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_laws.id
    }

    azure_policy {
      enabled = true
    }

    role_based_access_control {
      enabled = true
      azure_active_directory {
        managed                = true
        admin_group_object_ids = [azuread_group.aks_admins.id]
      }
    }
  }
*/

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = "Development"
  }
}