output "lb_name" {
  description = "Name of the Load Balancer"
  value       = azurerm_lb.lb.name
}

output "lb_id" {
  description = "Id of the Load Balancer"
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
  description = "Id of the Public IP address if any"
  value       = join("", azurerm_public_ip.ip.*.id)
}

output "pubip_domain_name_label" {
  description = "Domain name label of the Public IP address if any"
  value       = join("", compact(azurerm_public_ip.ip.*.domain_name_label))
}

output "pubip_ip_address" {
  description = "IP address of the Public IP address if any"
  value       = join("", azurerm_public_ip.ip.*.ip_address)
}

output "pubip_fqdn" {
  description = "FQDN of the Public IP address if any"
  value       = join("", compact(azurerm_public_ip.ip.*.fqdn))
}

output "backend_address_pool_id" {
  description = "Id of the associated default backend address pool"
  value       = azurerm_lb_backend_address_pool.default_pool.id
}

output "backend_address_pool_name" {
  description = "Name of the associated default backend address pool"
  value       = azurerm_lb_backend_address_pool.default_pool.name
}

output "backend_address_pool_ip_configurations" {
  description = "IP configurations of the associated default backend address pool"
  value       = azurerm_lb_backend_address_pool.default_pool.backend_ip_configurations
}

output "backend_address_pool_load_balancing_rules" {
  description = "Load balancing rules of the associated default backend address pool"
  value       = azurerm_lb_backend_address_pool.default_pool.load_balancing_rules
}

output "outbound_rule_id" {
  description = "Id of the default outbound rule if any"
  value       = join("", azurerm_lb_outbound_rule.outbound.*.id)
}

output "outbound_rule_name" {
  description = "Name of the default outbound rule if any"
  value       = join("", azurerm_lb_outbound_rule.outbound.*.name)
}

output "outbound_rule_allocated_outbound_ports" {
  description = "Number of allocated oubound ports of the default outbound rule if any"
  value       = join("", azurerm_lb_outbound_rule.outbound.*.allocated_outbound_ports)
}
