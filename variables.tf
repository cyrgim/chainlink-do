// Digital ocean
variable "do_token" {
  description = "PAT Token to access DO account"
  type        = string
  sensitive   = true
}

// Generic
variable "region" {
  description = "Region where the chainlink solution will be deployed"
  type        = string
  default     = "fra1"
}

// VPC
variable "ip_range" {
  description = "IP range of the chainlink VPC"
  type        = string
  default     = "10.10.10.0/24"
}

// Postgres
variable "postgres_version" {
  description = "Postgres version"
  type        = number
  default     = 12
}

variable "postgres_size" {
  description = "Postgres size"
  type        = string
  default     = "db-s-1vcpu-1gb"
}

variable "chainlink_role_name" {
  description = "Name of chainlink postgres role"
  type        = string
  default     = "chainlink"
}

variable "chainlink_db_name" {
  description = "Name of the chainlink database"
  type        = string
  default     = "chainlink"
}

// Kubernetes
variable "k8s_version" {
  description = "Version of the kubernetes cluster"
  type        = string
  default     = "1.20.2-do.0"
}

variable "k8s_node_size" {
  description = "Size of the kubernetes nodes"
  type        = string
  default     = "s-1vcpu-2gb"
}

variable "k8s_node_count" {
  description = "Number of nodes of the kubernetes cluster"
  type        = number
  default     = 2
}

// Chainlink node configuration
variable "helm_chart_version" {
  description = "Helm chart version: https://github.com/vulcanlink/charts/tree/develop/chainlink"
  type        = string
  default     = "0.2.8"
}

variable "eth_url" {
  description = "Ethereum URL"
  type        = string
}

variable "api_email" {
  description = "Email used to connect chainlink UI"
  type        = string
}

variable "node_configuration" {
  description = "Node on mainet or rinkeby?"
  type        = string
  default     = "rinkeby" # 2 values possible: "rinkeby" or "mainet"
}

variable "oracle_contract_address" {
  description = "Oracle contract addess"
  type        = string
}

variable "replica_count" {
  description = "Number of chainlink node"
  type        = number
  default     = 1
}