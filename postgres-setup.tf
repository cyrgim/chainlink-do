// Password for the postgres role
resource "random_password" "postgres_role_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "postgresql_role" "chainlink_role" {
  name     = var.chainlink_role_name
  login    = true
  password = random_password.postgres_role_password.result
}

resource "postgresql_database" "chainlink_database" {
  name              = var.chainlink_db_name
  owner             = postgresql_role.chainlink_role.name
  connection_limit  = -1
  allow_connections = true
}