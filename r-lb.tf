resource "azurerm_public_ip" "ip" {
  count = var.allocate_public_ip ? 1 : 0

  location            = var.location
  name                = local.ip_name
  resource_group_name = var.resource_group_name

  sku               = var.public_ip_sku
  allocation_method = var.public_ip_allocation_method

  tags = merge(local.default_tags, var.extra_tags, var.ip_extra_tags)
}

resource "azurerm_lb" "lb" {
  location            = var.location
  name                = local.lb_name
  resource_group_name = var.resource_group_name

  sku = var.sku_name

  dynamic "frontend_ip_configuration" {
    for_each = azurerm_public_ip.ip
    content {
      name                 = local.ip_configuration_name
      public_ip_address_id = frontend_ip_configuration.value.id
    }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.lb_frontend_ip_configurations
    content {
      name = each.key

      subnet_id                     = lookup(each.value, "subnet_id", null)
      private_ip_address            = lookup(each.value, "private_ip_address", null)
      private_ip_address_allocation = lookup(each.value, "private_ip_address_allocation", "Dynamic")
      zones                         = lookup(each.value, "zones", null)
    }
  }
  #      private_ip_address_version    = lookup(each.value, "private_ip_address_version", "IPv4")

  tags = merge(local.default_tags, var.extra_tags, var.lb_extra_tags)
}

resource "azurerm_lb_backend_address_pool" "default_pool" {
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "defautlBackendAddressPool"
  resource_group_name = var.resource_group_name
}

resource "azurerm_lb_outbound_rule" "outbound" {
  count = var.enable_nat ? 1 : 0

  name                = "default"
  resource_group_name = var.resource_group_name

  backend_address_pool_id  = azurerm_lb_backend_address_pool.default_pool.id
  loadbalancer_id          = azurerm_lb.lb.id
  protocol                 = var.nat_protocol
  allocated_outbound_ports = var.nat_allocated_outbound_ports

  frontend_ip_configuration {
    name = local.ip_configuration_name
  }
}
