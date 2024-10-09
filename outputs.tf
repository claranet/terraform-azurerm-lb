output "resource" {
  description = "Load Balancer resource object."
  value       = azurerm_lb.main
}

output "name" {
  description = "Name of the Load Balancer."
  value       = azurerm_lb.main.name
}

output "id" {
  description = "ID of the Load Balancer."
  value       = azurerm_lb.main.id
}

output "private_ip_address" {
  description = "Private IP address of the Load Balancer."
  value       = azurerm_lb.main.private_ip_address
}

output "private_ip_addresses" {
  description = "Private IP addresses of the Load Balancer."
  value       = azurerm_lb.main.private_ip_addresses
}

output "frontend_ip_configuration" {
  description = "Load Balancer's frontend IP configuration as described [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#frontend_ip_configuration)."
  value       = azurerm_lb.main.frontend_ip_configuration
}

# Public IP address outputs
output "pubip" {
  description = "Public IP address resource object if any."
  value       = one(azurerm_public_ip.main[*])
}

output "pubip_id" {
  description = "ID of the public IP address if any."
  value       = one(azurerm_public_ip.main[*].id)
}

output "pubip_domain_name_label" {
  description = "Domain name label of the public IP address if any."
  value       = one(azurerm_public_ip.main[*].domain_name_label)
}

output "pubip_ip_address" {
  description = "IP address of the public IP address if any."
  value       = one(azurerm_public_ip.main[*].ip_address)
}

output "pubip_fqdn" {
  description = "FQDN of the public IP address if any."
  value       = one(azurerm_public_ip.main[*].fqdn)
}

# Backend address pool outputs
output "backend_address_pool" {
  description = "Load Balancer's default backend address pool resource object."
  value       = azurerm_lb_backend_address_pool.main
}

output "backend_address_pool_id" {
  description = "ID of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.main.id
}

output "backend_address_pool_name" {
  description = "Name of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.main.name
}

output "backend_address_pool_ip_configurations" {
  description = "IP configurations of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.main.backend_ip_configurations
}

output "backend_address_pool_load_balancing_rules" {
  description = "Load balancing rules of the associated default backend address pool."
  value       = azurerm_lb_backend_address_pool.main.load_balancing_rules
}

# NAT rule outputs
output "oubound_rule" {
  description = "Load Balancer's default outbound rule resource object if any."
  value       = one(azurerm_lb_outbound_rule.main[*])
}

output "outbound_rule_id" {
  description = "ID of the default outbound rule if any."
  value       = one(azurerm_lb_outbound_rule.main[*].id)
}

output "outbound_rule_name" {
  description = "Name of the default outbound rule if any."
  value       = one(azurerm_lb_outbound_rule.main[*].name)
}

output "outbound_rule_allocated_outbound_ports" {
  description = "Number of allocated oubound ports of the default outbound rule if any."
  value       = one(azurerm_lb_outbound_rule.main[*].allocated_outbound_ports)
}
