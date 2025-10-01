data "azurerm_network_interface" "datanic" {
  name                = var.nicname
  resource_group_name = var.rgname
}