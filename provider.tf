provider "hsdp" {
  region = var.region
}

provider "cloudfoundry" {
  api_url  = data.hsdp_config.cf.url
  user     = var.cf_username
  password = var.cf_password
}

provider "grafana" {
  url  = "https://${module.thanos.grafana_endpoint}"
  auth = "${var.grafana_user}:${var.grafana_password}"
}
