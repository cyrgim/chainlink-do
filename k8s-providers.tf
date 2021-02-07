provider "kubernetes" {
  host  = digitalocean_kubernetes_cluster.chainlink_k8s.endpoint
  token = digitalocean_kubernetes_cluster.chainlink_k8s.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.chainlink_k8s.kube_config[0].cluster_ca_certificate
  )
}