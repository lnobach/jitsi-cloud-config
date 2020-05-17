
output "server_ipv4" {
  value = hcloud_server.meet.ipv4_address
}

output "server_ipv6" {
  value = hcloud_server.meet.ipv6_address
}

output "float_ipv4" {
  value = hcloud_floating_ip.meet_v4.ip_address
}

output "float_ipv6" {
  value = hcloud_floating_ip.meet_v6.ip_address
}
