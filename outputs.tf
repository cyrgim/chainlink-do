output "database_url" {
  description = "URL to connect database"
  value       = format("postgresql://%s:%s@%s:%s/%s", postgresql_role.chainlink_role.name, postgresql_role.chainlink_role.password, digitalocean_database_cluster.postgres_cluster.host, digitalocean_database_cluster.postgres_cluster.port, postgresql_database.chainlink_database.name)
}

output "node_password" {
  description = "Password used to start the chainlink node"
  value       = random_password.node_password.result
}

output "api_email" {
  description = "Email used to connect chainlink UI"
  value       = var.api_email
}

output "api_password" {
  description = "Password used to connect chainlink UI"
  value       = random_password.api_password.result
}