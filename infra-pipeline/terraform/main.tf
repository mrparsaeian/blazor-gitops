provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "k8s_node" {
  name        = var.vps_name
  server_type = var.vps_type
  location    = var.vps_location
  image       = var.vps_image
  ssh_keys    = [var.ssh_key_id]

  labels = {
    environment = "kubernetes"
  }
}

output "vps_ip" {
  value = hcloud_server.k8s_node.ipv4_address
}
