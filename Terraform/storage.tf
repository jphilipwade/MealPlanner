## storage account
resource "azurerm_storage_account" "sa" {
  resource_group_name      = azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "${var.product}${var.storage_account_prefix}${var.environment}"
}

## app service plan
resource "azurerm_app_service_plan" "asp" {
  name                = "${var.product}-${var.app_service_plan_prefix}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FunctionApp"
  reserved            = false
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}