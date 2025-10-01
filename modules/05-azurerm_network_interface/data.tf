data "azurerm_subnet" "subnet_data" {
  name                 = var.subnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.rgname
}