module "thanos" {
  source  = "philips-labs/thanos/cloudfoundry"
  version = "4.0.8"

  cf_org_name      = var.cf_org_name
  cf_space_id      = data.cloudfoundry_space.space.id
  grafana_password = var.grafana_password

  // needed for paas_prometheus_exporter
  environment = {
    USERNAME = var.cf_username
    PASSWORD = var.cf_password
    //noinspection HILUnresolvedReference
    API_ENDPOINT       = data.hsdp_config.cf.url
    ENABLE_CF_EXPORTER = true
  }
}

data "hsdp_config" "cf" {
  service = "cf"
}
