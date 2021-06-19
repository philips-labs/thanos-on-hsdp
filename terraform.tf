terraform {
  required_providers {
    hsdp = {
      source  = "philips-software/hsdp"
      version = ">= 0.14.3"
    }
    cloudfoundry = {
      source = "cloudfoundry-community/cloudfoundry"
    }
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.11.0"
    }
  }
}
