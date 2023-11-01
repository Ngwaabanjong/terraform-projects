#Create Public IP
resource "azurerm_public_ip" "example" {
  name                = "${var.project_name}-pubIP"
  resource_group_name = azurerm_resource_group.prj-group.name
  location            = azurerm_resource_group.prj-group.location
  allocation_method   = "Dynamic" #this Ip will not show until it's apply to a resource

  tags = {
    environment = var.env
  }
}