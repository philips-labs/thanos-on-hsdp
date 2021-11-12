locals {
  // Save the Prometheus Rules YAML file under the same path where the TF files are present
  config = templatefile("prometheus_rules.yml", {})
  yaml   = yamldecode(local.config)

  json = jsonencode(local.yaml)
}

resource "cloudfoundry_app" "appname" {
  name         = "tf-${var.postfix}"
  space        = var.cf_space_id
  memory       = var.memory
  disk_quota   = var.disk
  docker_image = "provide the docker path"

  docker_credentials = {
    username = var.docker_username
    password = var.docker_password
  }

  labels = {
    "variant.tva/exporter" = true,
    "variant.tva/rules"    = false,
  }
  annotations = {
    "prometheus.exporter.port" = "8001"
    "prometheus.exporter.path" = "/metrics"
    "prometheus.rules.json"    = local.json
  }

  routes {
    route = cloudfoundry_route.directory_service_internal.id
  }
  routes {
    route = cloudfoundry_route.public.id
  }

}

resource "cloudfoundry_route" "directory_service_internal" {
  domain   = data.cloudfoundry_domain.apps_internal_domain.id
  space    = var.cf_space_id
  hostname = "thanos-query-${var.postfix}"
}

resource "cloudfoundry_route" "public" {
  domain   = data.cloudfoundry_domain.domain.id
  space    = var.cf_space_id
  hostname = "thanos-query-${var.postfix}"
}
