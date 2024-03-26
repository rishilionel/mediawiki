variable "aks_name" {
    default = "aks_media_wiki"
}

variable "aks_location" {
    default = "centralindia"
}

variable "rg_name" {
    default = "rg-mediawiki"
}

variable "dns_prefix" {
    default = "aks-media-wiki"
}

variable "aks_default_pool" {
    type = object({
        name       = string
        node_count = number
        vm_size    = string
    })
    default = {
        name       = "system"
        node_count = 1
        vm_size    = "Standard_D2s_v3"
    }
}

variable "aks_user_pool" {
    type = object({
        name       = string
        node_count = number
        vm_size    = string
    })
    default = {
        name       = "user"
        node_count = 1
        vm_size    = "Standard_D2s_v3"
    }
}


variable "aks_identity" {
    default = "SystemAssigned"
}