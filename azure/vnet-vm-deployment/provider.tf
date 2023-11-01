
provider "azurerm" {
    features {}
  # Configuration options
}

resource "azurerm_resource_group" "prj-group" {
    name = "${var.project_name}-prj-grp"
    location = "North Central US"

}