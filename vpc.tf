resource "digitalocean_vpc" "chainlink_vpc" {
  name     = "chainlink-vpc"
  region   = var.region
  ip_range = var.ip_range
}