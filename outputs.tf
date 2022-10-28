output "lb_name" {
  description = "Name of the Load Balancer"
  value       = azurerm_lb.lb.name
}

output "lb_id" {
  description = "ID of the Load Balancer."
  value       = azurerm_lb.lb.id
}

output "lb_private_ip_address" {
  description = "Private IP address of the Load Balancer"
  value       = azurerm_lb.lb.private_ip_address
}

output "lb_private_ip_addresses" {
  description = "Private IP addresses of the Load Balancer"
  value       = azurerm_lb.lb.private_ip_addresses
}

output "pubip_id" {
  description = "ID of the public IP address if any."
  value       = try(azurerm_public_ip.ip["enabled"].id, null)
}

output "pubip_domain_name_label" {
  description = "Domain name label of the public IP address if any."
  value       = try(azurerm_public_ip.ip["enabled"].domain_name_label, null)
}

output "pubip_ip_address" {
  description = "IP address of the public IP address if any."
  value       = try(azurerm_public_ip.ip["enabled"].ip_address, null)
}

output "pubip_fqdn" {
  description = "FQDN of the public IP address if any."
  value       = try(azurerm_public_ip.ip["enabled"].fqdn, null)
}

output "backend_address_pool_id" {
  description = "ID of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.default_pool.id
}

output "backend_address_pool_name" {
  description = "Name of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.default_pool.name
}

output "backend_address_pool_ip_configurations" {
  description = "IP configurations of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.default_pool.backend_ip_configurations
}

output "backend_address_pool_load_balancing_rules" {
  description = "Load balancing rules of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.default_pool.load_balancing_rules
}

output "outbound_rule_id" {
  description = "ID of the default outbound rule if any."
  value       = one(azurerm_lb_outbound_rule.outbound[*].id)
}

output "outbound_rule_name" {
  description = "Name of the default outbound rule if any."
  value       = one(azurerm_lb_outbound_rule.outbound[*].name)
}

output "outbound_rule_allocated_outbound_ports" {
  description = "Number of allocated oubound ports of the default outbound rule if any."
  value       = one(azurerm_lb_outbound_rule.outbound[*].allocated_outbound_ports)
}

output "frontend_ip_configuration" {
  description = "Load Balancer's frontend IP configuration as described here https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#frontend_ip_configuration."
  value       = azurerm_lb.lb.frontend_ip_configuration
}
