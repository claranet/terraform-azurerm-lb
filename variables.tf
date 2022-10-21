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
  description = "`frontend_ip_configuration` blocks as documented here: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#frontend_ip_configuration."
  type = map(object({
    subnet_id = string

    zones = optional(list(number))

    private_ip_address            = optional(string)
    private_ip_address_allocation = optional(string, "Dynamic")
    private_ip_address_version    = optional(string, "IPv4")

    public_ip_address_id = optional(string)
    public_ip_prefix_id  = optional(string)

    gateway_load_balancer_frontend_ip_configuration_id = optional(string)
  }))
  default = {}
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which the Public IP Address for this Load Balancer should be located. Also used as default for `frontend_ip_configuration` zones"
  type        = list(number)
  default     = [1, 2, 3]
}
