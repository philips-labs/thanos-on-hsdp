module "thanos" {
  source  = "philips-labs/thanos/cloudfoundry"
  version = "2.0.2"

  cf_org_name      = var.cf_org_name
  cf_space_name    = var.cf_space_name
  grafana_password = var.grafana_password

  // needed for paas_prometheus_exporter
  environment = {
    USERNAME           = var.cf_username
    PASSWORD           = var.cf_password
    API_ENDPOINT       = data.hsdp_config.cf.url
    ENABLE_CF_EXPORTER = true
  }
}

data "hsdp_config" "cf" {
  service = "cf"
}
