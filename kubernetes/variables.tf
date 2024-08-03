
variable "namespace" {
  type    = string
  default = "default"
}

variable "cluster_name" {
  type    = string
  default = "eks-cluster"
}

variable "externalservices_prometheus_host" {
  type    = string
  default = "https://prometheus-prod-24-prod-eu-west-2.grafana.net"
}

variable "externalservices_prometheus_basicauth_username" {
  type    = number
  default = 1454023
}

variable "externalservices_prometheus_basicauth_password" {
  type = string
}

variable "externalservices_loki_host" {
  type    = string
  default = "https://logs-prod-012.grafana.net"
}

variable "externalservices_loki_basicauth_username" {
  type    = number
  default = 826001
}

variable "externalservices_loki_basicauth_password" {
  type    = string
  default = ""
}

variable "externalservices_tempo_host" {
  type    = string
  default = "https://tempo-prod-10-prod-eu-west-2.grafana.net:443"
}

variable "externalservices_tempo_basicauth_username" {
  type    = number
  default = 822976
}

variable "externalservices_tempo_basicauth_password" {
  type = string
}

variable "metrics_enabled" {
  type    = bool
  default = true
}

variable "metrics_alloy_metricstuning_useintegrationallowlist" {
  type    = bool
  default = true
}

variable "metrics_cost_enabled" {
  type    = bool
  default = true
}

variable "metrics_node_exporter_enabled" {
  type    = bool
  default = true
}

variable "logs_enabled" {
  type    = bool
  default = true
}

variable "logs_pod_logs_enabled" {
  type    = bool
  default = true
}

variable "logs_cluster_events_enabled" {
  type    = bool
  default = true
}

variable "traces_enabled" {
  type    = bool
  default = true
}

variable "receivers_grpc_enabled" {
  type    = bool
  default = true
}

variable "receivers_http_enabled" {
  type    = bool
  default = true
}

variable "receivers_zipkin_enabled" {
  type    = bool
  default = true
}

variable "receivers_grafanacloudmetrics_enabled" {
  type    = bool
  default = true
}

variable "opencost_enabled" {
  type    = bool
  default = true
}

variable "kube_state_metrics_enabled" {
  type    = bool
  default = true
}

variable "prometheus_node_exporter_enabled" {
  type    = bool
  default = true
}

variable "prometheus_operator_crds_enabled" {
  type    = bool
  default = true
}

variable "workspace_iam_roles" {
  type = map(string)
  default = {
    production = "arn:aws:iam::058264337640:role/Terraform"
  }
}

variable "environment" {
  type = string
}

variable "region" {
  default = "eu-west-1"
  type    = string
}
