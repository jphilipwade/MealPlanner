locals {
  package_path = "../build/functions.zip"
  package_hash = filemd5(local.package_path)
}

## storage account
resource "azurerm_storage_account" "sa" {
  resource_group_name      = azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "${var.product}${var.storage_account_prefix}${var.environment}"
}

## containers
resource "azurerm_storage_container" "deployment_packages" {
  name                  = "${var.product}-${var.container_prefix}-pkg-${var.location}-${var.environment}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

## sas
data "azurerm_storage_account_sas" "sas" {
  connection_string = azurerm_storage_account.sa.primary_connection_string
  https_only        = true
  start             = "2022-06-23"
  expiry            = "2023-12-31"
  resource_types {
    object    = true
    container = false
    service   = false
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}

# function package
resource "azurerm_storage_blob" "code" {
  name                   = "functions-${local.package_hash}.zip"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.deployment_packages.name
  type                   = "Block"
  source                 = local.package_path
}
