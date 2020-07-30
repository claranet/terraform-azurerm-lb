locals {
  default_tags = {
    env   = var.environment
    stack = var.stack
  }

  name_prefix = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""

  lb_name = coalesce(
    var.lb_custom_name,
    "${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}-lb",
  )

  ip_name = coalesce(
    var.ip_custom_name,
    "${local.lb_name}-pubip",
  )

  ip_configuration_name = "LoadBalancerFrontEnd"
}
