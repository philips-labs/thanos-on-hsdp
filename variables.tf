variable "cf_username" {}
variable "cf_password" {}
variable "cf_org_name" {}
variable "cf_space_name" {}
variable "region" {}
variable "environment" {}
variable "grafana_user" {
  type = string
}
variable "name_postfix" {
  type = string
}
variable "docker_username" {
  type = string
}
variable "docker_password" {
  type = string
}

variable "memory" {
  type = string
}

variable "disk" {
  type = string
}
variable "grafana_password" {
  type = string
}

variable "cf_space_id" {
  type = string
}

variable "postfix" {
  type = string
}

variable "iam_application_id" {
  type = string
}

variable "oauth2_client_id" {
  type = string
}

variable "oauth2_password" {
  type = string
}

variable "org_admin_username" {
  type = string
}

variable "org_admin_password" {
  type = string
}