resource "digitalocean_kubernetes_cluster" "chainlink_k8s" {
  name     = "chainlink-k8s"
  region   = var.region
  version  = var.k8s_version
  vpc_uuid = digitalocean_vpc.chainlink_vpc.id
  tags     = ["chainlink-cluster"]

  node_pool {
    name       = "worker-pool"
    size       = var.k8s_node_size
    node_count = var.k8s_node_count
  }
}