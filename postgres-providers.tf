provider "postgresql" {
  host            = digitalocean_database_cluster.postgres_cluster.host
  port            = digitalocean_database_cluster.postgres_cluster.port
  database        = digitalocean_database_cluster.postgres_cluster.database
  username        = digitalocean_database_cluster.postgres_cluster.user
  password        = digitalocean_database_cluster.postgres_cluster.password
  sslmode         = "require"
  connect_timeout = 15
  superuser       = false
}