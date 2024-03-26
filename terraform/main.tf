module "rg" {
  source = "./modules/azure_resource_group"
  mediawiki-rg = var.mediawiki-rg
  mediawiki-location = var.mediawiki-location
}

module "aks" {
  source = "./modules/azure_kubernetes_service"
  aks_name = var.aks_name
  aks_location = var.mediawiki-location
  rg_name = var.mediawiki-rg
  dns_prefix = var.dns_prefix
  aks_identity = var.aks_identity
  aks_default_pool = var.aks_default_pool
  aks_user_pool = var.aks_user_pool
  depends_on = [ module.rg ]
}