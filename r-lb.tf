resource "azurerm_public_ip" "main" {
  count = var.public_ip_allocated ? 1 : 0

  location            = var.location
  name                = local.ip_name
  resource_group_name = var.resource_group_name

  sku               = var.public_ip_sku
  allocation_method = var.public_ip_allocation_method
  domain_name_label = var.public_ip_custom_domain_name_label == null ? null : coalesce(var.public_ip_custom_domain_name_label, local.name)

  zones = var.zones

  tags = merge(local.default_tags, var.extra_tags, var.ip_extra_tags)
}

moved {
  from = azurerm_public_ip.ip["enabled"]
  to   = azurerm_public_ip.main[0]
}

moved {
  from = azurerm_lb.lb
  to   = azurerm_lb.main
}

resource "azurerm_lb" "main" {
  location            = var.location
  name                = local.name
  resource_group_name = var.resource_group_name

  sku = var.sku_name

  dynamic "frontend_ip_configuration" {
    for_each = azurerm_public_ip.main[*]
    content {
      name                 = local.ip_configuration_name
      public_ip_address_id = frontend_ip_configuration.value.id
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configurations
    iterator = fipconf

    content {
      name = fipconf.key

      subnet_id                     = fipconf.value.subnet_id
      private_ip_address            = fipconf.value.private_ip_address
      private_ip_address_allocation = fipconf.value.private_ip_address_allocation
      private_ip_address_version    = fipconf.value.private_ip_address_version

      public_ip_address_id = fipconf.value.public_ip_address_id
      public_ip_prefix_id  = fipconf.value.public_ip_prefix_id

      zones = fipconf.value.zones != null ? fipconf.value.zones : var.zones
    }
  }

  tags = merge(local.default_tags, var.extra_tags, var.lb_extra_tags)
}

resource "azurerm_lb_backend_address_pool" "main" {
  loadbalancer_id = azurerm_lb.main.id
  name            = local.default_pool_name
}

moved {
  from = azurerm_lb_backend_address_pool.default_pool
  to   = azurerm_lb_backend_address_pool.main
}

resource "azurerm_lb_outbound_rule" "main" {
  count = var.nat_enabled ? 1 : 0

  name = "default"

  backend_address_pool_id  = azurerm_lb_backend_address_pool.main.id
  loadbalancer_id          = azurerm_lb.main.id
  protocol                 = var.nat_protocol
  allocated_outbound_ports = var.nat_allocated_outbound_ports

  frontend_ip_configuration {
    name = local.ip_configuration_name
  }
}

moved {
  from = azurerm_lb_outbound_rule.outbound
  to   = azurerm_lb_outbound_rule.main
}
