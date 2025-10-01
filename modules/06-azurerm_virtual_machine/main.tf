

resource "azurerm_linux_virtual_machine" "vm_block" {
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.location
  size                = var.size
  admin_username      = var.username
  admin_password = var.password

  network_interface_ids = [data.azurerm_network_interface.datanic.id]


  disable_password_authentication = false
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }
  