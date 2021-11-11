// Commented out until we add the grafana module
  
/*
output "grafana_endpoint" {
  value = "https://${module.thanos.grafana_endpoint}"
}

output "grafana_auth" {
  sensitive = true
  value     = module.thanos.grafana_auth
}
*/
