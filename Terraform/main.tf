terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

## resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.resource_group_prefix}-${var.environment}"
  location = var.location
}

## application insights
resource "azurerm_application_insights" "ai" {
  name                = "${var.product}-${var.app_insights_prefix}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}