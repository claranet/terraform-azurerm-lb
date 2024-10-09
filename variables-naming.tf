# Generic naming variables
variable "name_prefix" {
  description = "Optional prefix for the generated name."
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name."
  type        = string
  default     = ""
}

# Custom naming override
variable "custom_name" {
  description = "Name of the Load Balancer, generated if not set."
  type        = string
  default     = ""
}

variable "default_backend_pool_custom_name" {
  description = "Name of the default Load Balancer backend pool, generated if not set."
  type        = string
  default     = ""
}

variable "ip_custom_name" {
  description = "Name of the Public IP address, generated if not set."
  type        = string
  default     = ""
}
