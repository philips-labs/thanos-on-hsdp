module "thanos" {
  source  = "philips-labs/thanos/cloudfoundry"
  version = "6.0.0"

  cf_org_name = var.cf_org_name
  cf_space_id = data.cloudfoundry_space.space.id

  // needed for paas_prometheus_exporter
  environment = {
    USERNAME = var.cf_username
    PASSWORD = var.cf_password
    //noinspection HILUnresolvedReference
    API_ENDPOINT       = data.hsdp_config.cf.url
    ENABLE_CF_EXPORTER = true
  }

  cf_functional_account = {
    api_endpoint = data.hsdp_config.cf.url
    username     = var.cf_username
    password     = var.cf_password
  }
}

data "hsdp_config" "cf" {
  service = "cf"
}
