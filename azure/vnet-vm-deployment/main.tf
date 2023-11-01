#Virtual Network
resource "azurerm_virtual_network""myvnet"{
    name = "${var.project_name}-VNET"
    resource_group_name = azurerm_resource_group.prj-group.name
    address_space       = var.myvnet_cidr
    location            = azurerm_resource_group.prj-group.location

#     tags = merge(local.tags, {
#       workload = "mega tip"
#   })
}

#subnet 1
resource "azurerm_subnet""mypubnet1"{
    name = "${var.project_name}-subnetput1"
    virtual_network_name = azurerm_virtual_network.myvnet.name
    resource_group_name = azurerm_resource_group.prj-group.name
    address_prefixes    = var.subnetput1_cidr

#     tags = merge(local.tags, {
#       workload = "mega tip"
#   })
}

#subnet 2
resource "azurerm_subnet""myprinet2"{
    name = "${var.project_name}-subprinet2"
    virtual_network_name = azurerm_virtual_network.myvnet.name
    resource_group_name = azurerm_resource_group.prj-group.name
    address_prefixes    = var.subnetpri2_cidr

#     tags = merge(local.tags, {
#       workload = "mega tip"
#   })
}





    