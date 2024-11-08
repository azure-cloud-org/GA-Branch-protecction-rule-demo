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

##Test the Github secret detection rule
resource "azurerm_mssql_server" "example-branch-protection" {
  name                         = "example-sqlserver-branch-protection"
  resource_group_name          = azurerm_resource_group.myrg-branch-protection.name
  location                     = azurerm_resource_group.myrg-branch-protection.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}