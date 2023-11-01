# #Create Linux VM
# resource "azurerm_linux_virtual_machine" "my_vm" {
#   name                = "${var.project_name}-VM"
#   resource_group_name = azurerm_resource_group.prj-group.name
#   location            = azurerm_resource_group.prj-group.location
#   size                = "Standard_F2"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.my_interface.id,
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }