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
  default     = "dev"
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
