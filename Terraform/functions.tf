## service plan
resource "azurerm_service_plan" "sp" {
  name                = "${var.product}-${var.app_service_plan_prefix}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "Y1"    ## Consumption Plan
}

## function app
//noinspection SpellCheckingInspection
resource "azurerm_linux_function_app" "fa" {
  name                 = "${var.product}-${var.function_app_prefix}-${var.environment}"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_name = azurerm_storage_account.sa.name
  service_plan_id      = azurerm_service_plan.sp.id
  
  app_settings = {
    https_only                     = true
    FUNCTIONS_WORKER_RUNTIME       = "dotnet",
    FUNCTION_APP_EDIT_MODE         = "readonly"
    WEBSITE_RUN_FROM_PACKAGE       = format("%s%s", azurerm_storage_blob.code.url, data.azurerm_storage_account_sas.sas.sas)
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.ai.instrumentation_key
  }

  //noinspection HCLUnknownBlockType
  site_config {}
}
