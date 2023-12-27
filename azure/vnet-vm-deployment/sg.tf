#Create SG
resource "azurerm_application_security_group" "my-sg" {
  name                = var.appsecuritygroup
  location            = azurerm_resource_group.prj-group.location
  resource_group_name = azurerm_resource_group.prj-group.name

  tags = {
    environment = var.env
  }
}

#CREATE NETWORK SG
resource "azurerm_network_security_group" "my-net-sg" {
  name                = var.netsecuritygroup
  location            = azurerm_resource_group.prj-group.location
  resource_group_name = azurerm_resource_group.prj-group.name

  security_rule {
    name                       = var.netsecuritygrouprule
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "XX.6.2XX.5X/32"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.env
  }
}

resource "azurerm_subnet_network_security_group_association" "sub-sg-asoc" {
  subnet_id                 = azurerm_subnet.mypubnet1.id
  network_security_group_id = azurerm_network_security_group.my-net-sg.id
}

resource "azurerm_subnet_network_security_group_association" "sub-sg-asoc2" {
  subnet_id                 = azurerm_subnet.myprinet2.id
  network_security_group_id = azurerm_network_security_group.my-net-sg.id
}