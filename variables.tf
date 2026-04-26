variable "resource_group_name" {
  description = "Resource group name"
  type = string
  default     = "rg-iac-azure-1-1"
}

variable "resource_group_location_main" {
  description = "Resource group location"
  type = string
  default     = "westeurope"
  validation {
    condition     = contains(["eastus", "westeurope", "centralus", "northeurope"], var.resource_group_location_main)
    error_message = "Allowed regions: eastus, westeurope, centralus, northeurope."
  }
}

variable "vnet1_name" {
  description = "Name of the first vnet"
  type = string
  default     = "vnet1"
}

variable "vnet2_name" {
  description = "Name of the second vnet"
  type = string
  default     = "vnet2"
}

variable "vnet_location" {
  description = "location of vnets"
  type = string
  default     = "westeurope"
}

variable "vnet1_address_space" {
  description = "first vnet ip space"
  type = list(string)
  default     = ["10.1.0.0/16"]
}

variable "vnet2_address_space" {
  description = "second vnet ip space"
  type = list(string)
  default     = ["10.2.0.0/16"]
}

variable "vnet1_subnet1_name" {
  description = "name of the subnet in the first vnet"
  type = string
  default     = "frondend_server"
}

variable "vnet1_subnet1_ip_prefix" {
  description = "ip subnet of the subnet in the first vnet"
  type = list(string)
  default     = ["10.1.1.0/24"]
}

variable "vnet2_subnet1_name" {
  description = "name of the subnet in the second vnet"
  type = string
  default     = "backend_server"
}

variable "vnet2_subnet1_ip_prefix" {
  description = "ip subnet of the subnet in the second vnet"
  type = list(string)
  default     = ["10.2.1.0/24"]
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}