provider "hsdp" {
  region             = var.region
  environment        = var.environment
  oauth2_client_id   = var.oauth2_client_id
  oauth2_password    = var.oauth2_password
  org_admin_username = var.org_admin_username
  org_admin_password = var.org_admin_password
}

provider "cloudfoundry" {
  //noinspection HILUnresolvedReference
  api_url  = data.hsdp_config.cf.url
  user     = var.cf_username
  password = var.cf_password
}

provider "grafana" {
  url  = "https://${module.thanos.grafana_endpoint}"
  auth = "${var.grafana_user}:${var.grafana_password}"
}
