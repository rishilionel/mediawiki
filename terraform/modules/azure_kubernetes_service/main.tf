resource "azurerm_kubernetes_cluster" "aks_1" {
    name                = var.aks_name
    location            = var.aks_location
    resource_group_name = var.rg_name
    dns_prefix          = var.dns_prefix

    http_application_routing_enabled = true
    
    default_node_pool {
    name       = var.aks_default_pool.name
    node_count = var.aks_default_pool.node_count
    vm_size    = var.aks_default_pool.vm_size
    }
    
    identity {
        type = var.aks_identity
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "user_node_pool" {
    kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_1.id
    name       = var.aks_user_pool.name
    node_count = var.aks_user_pool.node_count
    vm_size    = var.aks_user_pool.vm_size
}