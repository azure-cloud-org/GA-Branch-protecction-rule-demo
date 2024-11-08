# Create a resource group
resource "azurerm_resource_group" "myrg-branch-protection" {
  name     = "myrg-demo-branch-protection-rule"
  location = "south india"
}


# Create Virtual Network
resource "azurerm_virtual_network" "myvnet-branch-protection" {
  name                = "myvnet-demo-branch-protection-rule"
  address_space       = ["10.13.0.0/24"]
  location            = azurerm_resource_group.myrg-branch-protection.location
  resource_group_name = azurerm_resource_group.myrg-branch-protection.name
}
