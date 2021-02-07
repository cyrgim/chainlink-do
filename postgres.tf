resource "digitalocean_database_cluster" "postgres_cluster" {
  name       = "postgres-cluster"
  engine     = "pg"
  version    = var.postgres_version
  size       = var.postgres_size
  region     = var.region
  node_count = 1
}