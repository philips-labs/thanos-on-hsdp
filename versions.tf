terraform {
  required_providers {
    hsdp = {
      source  = "philips-software/hsdp"
      version = ">= 0.17.0"
    }
    cloudfoundry = {
      source = "cloudfoundry-community/cloudfoundry"
    }
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.14.0"
    }
  }
}
