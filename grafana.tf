module "grafana" {
  source             = "philips-labs/grafana/cloudfoundry"
  version            = "0.16.0"
  cf_org_name        = var.cf_org_name
  cf_space_id        = var.cf_space_id
  name_postfix       = var.name_postfix
  grafana_username   = var.grafana_username
  grafana_password   = var.grafana_password
  iam_application_id = var.iam_application_id
  oauth_allow_signup = true

  network_policies = [
    {
      destination_app = module.thanos.thanos_query_app_id
      protocol        = "tcp"
      port            = "9090"
    }
  ]
}