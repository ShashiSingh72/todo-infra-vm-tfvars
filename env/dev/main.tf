module "rg" {
  source   = "../../modules/01-azurerm_resource_group"
  rgname   = var.rgname
  location = var.location
}

module "vnet" {
  source        = "../../modules/02-azurerm_virtual_network"
  depends_on    = [module.rg]
  vnetname      = var.vnetname
  location      = var.location
  rgname        = var.rgname
  address_space = var.address_space
}

module "subnet" {
  depends_on       = [module.rg, module.vnet]
  source           = "../../modules/03-azurerm_subnet"
  subnetname       = var.subnetname
  rgname           = var.rgname
  vnetname         = var.vnetname
  address_prefixes = var.address_prefixes

}


module "pip_block" {
  source     = "../../modules/04-azurerm_public_ip"
  depends_on = [module.rg]
  pipname    = var.pipname
  rgname     = var.rgname
  location   = var.location
}

module "nic" {
  source     = "../../modules/05-azurerm_network_interface"
  depends_on = [module.subnet, module.vnet, module.rg]
  nicname    = var.nicname
  location   = var.location
  rgname     = var.rgname
  subnetname = var.subnetname
  vnetname   = var.vnetname
}

module "vm" {
  source     = "../../modules/06-azurerm_virtual_machine"
  depends_on = [module.nic ,module.rg]
  vmname     = var.vmname
  rgname     = var.rgname
  location   = var.location
  size       = var.size
  username   = var.username
  password   = var.password
  nicname    = var.nicname
}
