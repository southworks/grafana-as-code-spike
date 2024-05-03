terraform {
   required_providers {
      grafana = {
         source  = "grafana/grafana"
         version = ">= 2.9.0"
      }
   }
}

provider "grafana" {
  alias = "graf"
  cloud_access_policy_token = "=="
}

resource "grafana_cloud_stack" "cloud" {
  provider = grafana.graf
  name        = "myteststack"
  slug        = "myteststack"
  region_slug = "us"
}

resource "grafana_cloud_stack_service_account" "cloud_sa" {
  provider = grafana.graf
  stack_slug = grafana_cloud_stack.cloud.slug

  name = "cloud service account"
  role = "Admin"
  is_disabled = false
}

resource "grafana_cloud_stack_service_account_token" "cloud_sa_token" {
  provider   = grafana.graf
  stack_slug = grafana_cloud_stack.cloud.slug

  name = "my_stack cloud_sa key"
  service_account_id = grafana_cloud_stack_service_account.cloud_sa.id
}

provider "grafana" {
  alias = "my_stack"
  url  = grafana_cloud_stack.cloud.url
  auth = grafana_cloud_stack_service_account_token.cloud_sa_token.key
}

resource "grafana_organization" "swks" {
  depends_on = [ grafana_cloud_stack_service_account_token.cloud_sa_token ]
  provider = grafana.my_stack
  name = "swks"
}

resource "grafana_folder" "swks_test_folder" {
  depends_on = [ grafana_cloud_stack_service_account_token.cloud_sa_token ]
  provider = grafana.my_stack
  org_id = grafana_organization.swks.org_id
  title  = "Test Folder"
}