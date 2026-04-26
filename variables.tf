variable "resource_group_name" {
  type = string
}

variable "resource_group_location_main" {
  type = string
}

variable "vnet1_name" {
  type = string
}

variable "vnet2_name" {
  type = string
}

variable "vnet_location" {
  type = string
}

variable "vnet1_address_space" {
  type = list(string)
}

variable "vnet2_address_space" {
  type = list(string)
}

variable "vnet1_subnet1_name" {
  type = string
}

variable "vnet1_subnet1_ip_prefix" {
  type = list(string)
}

variable "vnet2_subnet1_name" {
  type = string
}

variable "vnet2_subnet1_ip_prefix" {
  type = list(string)
}
