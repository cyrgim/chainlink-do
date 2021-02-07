// Password for the postgres role
resource "random_password" "node_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "random_password" "api_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

// Deploy chainlink
resource "helm_release" "chainlink" {
  name             = "chainlink"
  chart            = "chainlink"
  repository       = "https://vulcanlink.github.io/charts/"
  version          = var.helm_chart_version
  namespace        = "chainlink"
  create_namespace = "true"
  values = [
    file("values/${var.node_configuration}-values.yaml")
  ]
  set {
    name  = "replicaCount"
    value = var.replica_count
  }

  set {
    name  = "config.DATABASE_URL"
    value = format("postgresql://%s:%s@%s:%s/%s", postgresql_role.chainlink_role.name, postgresql_role.chainlink_role.password, digitalocean_database_cluster.postgres_cluster.host, digitalocean_database_cluster.postgres_cluster.port, postgresql_database.chainlink_database.name)
  }

  set {
    name  = "config.ETH_URL"
    value = var.eth_url
  }

  set {
    name  = "config.ORACLE_CONTRACT_ADDRESS"
    value = var.oracle_contract_address
  }

  set {
    name  = "config.WALLET_PASSWORD"
    value = random_password.node_password.result
  }

  set {
    name  = "config.API_LOGIN"
    value = "${var.api_email}\n${random_password.api_password.result}"
  }
}