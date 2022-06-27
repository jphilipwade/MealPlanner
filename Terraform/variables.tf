## other
variable "product" {
  type        = string
  description = "Name of the product"
  default     = "mplan"
}

variable "location" {
  type        = string
  description = "Region"
  default     = "uksouth"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "pw"
}


## prefixes
variable "resource_group_prefix" {
  type    = string
  default = "rg"
}

variable "storage_account_prefix" {
  type    = string
  default = "sa"
}

variable "app_insights_prefix" {
  type    = string
  default = "ai"
}

variable "app_service_plan_prefix" {
  type    = string
  default = "asp"
}

variable "function_app_prefix" {
  type    = string
  default = "fa"
}

variable "container_prefix" {
  type    = string
  default = "c"
}

