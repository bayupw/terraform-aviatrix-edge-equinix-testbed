output "router_dx_config" {
  value = var.create_dx && var.create_pvif ? try(local.router_dx_config, "") : ""
}

output "router_er_config" {
  value = var.create_er ? try(local.router_er_config, "") : ""
}

output "router_interface_config" {
  value = var.create_pvif && var.create_aviatrix_edge ? try(local.router_interface_config, "") : ""
}

output "router_ssh_command" {
  value = var.create_router ? "ssh ${[for v in equinix_network_device.this[0].ssh_key : v][0].username}@${equinix_network_device.this[0].ssh_ip_address}" : ""
}

output "router_ssh_password" {
  value = var.create_router ? equinix_network_device.this[0].vendor_configuration["adminPassword"] : ""
}