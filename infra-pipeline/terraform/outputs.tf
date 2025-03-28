output "vps_ssh_connection" {
  value = "ssh root@${hcloud_server.k8s_node.ipv4_address}"
}
