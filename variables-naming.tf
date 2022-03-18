# Generic naming variables
variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name"
  type        = string
  default     = ""
}

variable "use_caf_naming" {
  description = "Use the Azure CAF naming provider to generate default resource name. `lb_custom_name` override this if set. Legacy default name is used if this is set to `false`."
  type        = bool
  default     = true
}

# Custom naming override
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
