output "grafana_endpoint" {
  value = "https://${module.thanos.grafana_endpoint}"
}
