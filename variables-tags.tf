variable "default_tags_enabled" {
  description = "Option to enable or disable default tags."
  type        = bool
  default     = true
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
