variable "hcloud_token" {
  type = string
}

variable "ssh_key_id" {
  type = string
}

variable "vps_name" {
  default = "k8s-single-node"
}

variable "vps_location" {
  default = "fsn1"
}

variable "vps_type" {
  default = "cx31"
}

variable "vps_image" {
  default = "ubuntu-22.04"
}
