locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  lb_name           = coalesce(var.lb_custom_name, data.azurecaf_name.lb.result)
  ip_name           = coalesce(var.ip_custom_name, data.azurecaf_name.pubip.result)
  default_pool_name = coalesce(var.lb_default_backend_pool_custom_name, data.azurecaf_name.default_pool.result)

  ip_configuration_name = "LoadBalancerFrontEnd"
}
