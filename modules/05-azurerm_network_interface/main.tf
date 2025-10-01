
resource "azurerm_network_interface" "nic_block" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data.id
    private_ip_address_allocation = "Static"
    
  }
}