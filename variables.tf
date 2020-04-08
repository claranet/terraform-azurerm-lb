variable "location" {
  description = "Azure location."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "sku_name" {
  description = "The Name of the SKU used for this Load Balancer. Possible values are \"Basic\" and \"Standard\"."
  type        = string
  default     = "Standard"
}

variable "extra_tags" {
  description = "Extra tags to add on all resources."
  type        = map(string)
  default     = {}
}

variable "lb_extra_tags" {
  description = "Extra tags to add to the Load Balancer."
  type        = map(string)
  default     = {}
}

variable "ip_extra_tags" {
  description = "Extra tags to add to the Public IP address."
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "lb_custom_name" {
  description = "Name of the Load Balancer, generated if not set."
  type        = string
  default     = ""
}

variable "ip_custom_name" {
  description = "Name of the Public IP address, generated if not set."
  type        = string
  default     = ""
}

variable "allocate_public_ip" {
  description = "True to allocate a Public IP to the Load Balancer."
  type        = bool
  default     = false
}

variable "public_ip_sku" {
  description = "SKU name for the Public IP address, can be `Basic` or `Standard`."
  type        = string
  default     = "Standard"
}

variable "public_ip_allocation_method" {
  description = "Allocation method for the Public IP address, can be `Static`, `Dynamic`."
  type        = string
  default     = "Static"
}

variable "enable_nat" {
  description = "True to enable NAT through Load Balancer outbound rules."
  type        = bool
  default     = false
}

variable "nat_allocated_outbound_ports" {
  description = "Number of allocated outbound ports for NAT."
  type        = number
  default     = 1024
}

variable "nat_protocol" {
  description = "Transport protocol to use for NAT."
  type        = string
  default     = "All"
}

variable "lb_frontend_ip_configurations" {
  description = "`frontend_ip_configuration` blocks as documented here: https://www.terraform.io/docs/providers/azurerm/r/lb.html#frontend_ip_configuration"
  type        = map(any)
  default     = {}
}
