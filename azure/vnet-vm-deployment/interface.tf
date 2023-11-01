#Create Network Interface

resource "azurerm_network_interface" "my_interface" {
    name              = "${var.project_name}-interface"
    location          = azurerm_resource_group.prj-group.location
    resource_group_name = azurerm_resource_group.prj-group.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.mypubnet1.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.example.id 
    }

    tags = {
      environment = var.env
    }
  
}