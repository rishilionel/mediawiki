resource "azurerm_resource_group" "rg-mediawiki" {
  name     = var.mediawiki-rg
  location = var.mediawiki-location
}