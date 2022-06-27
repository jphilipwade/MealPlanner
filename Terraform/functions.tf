## function app
resource "azurerm_function_app" "fa" {
  name                       = "${var.product}-${var.function_app_prefix}-${var.environment}"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key

  app_settings = {
    https_only                     = true
    FUNCTIONS_WORKER_RUNTIME       = "node",
    FUNCTION_APP_EDIT_MODE         = "readonly"
    WEBSITE_RUN_FROM_PACKAGE       = ""##format("%s%s", azurerm_storage_blob.code.url, data.azurerm_storage_account_sas.sas.sas)
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.ai.instrumentation_key,
    WEBSITE_NODE_DEFAULT_VERSION : "~14"
  }

  site_config {
    use_32_bit_worker_process = false
  }
}