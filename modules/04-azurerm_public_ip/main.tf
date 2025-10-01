
resource "azurerm_public_ip" "pip_block" {
  name                = var.pipname
  resource_group_name = var.rgname
  location            = var.location
  allocation_method   = "Static"

}
