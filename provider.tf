provider "hsdp" {
  region           = "us-east"
  environment      = "client-test"
  oauth2_client_id = var.us_east_ct_oauth2_client_id
  oauth2_password  = var.us_east_ct_oauth2_password
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
