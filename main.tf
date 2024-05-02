terraform {
   required_providers {
      grafana = {
         source  = "grafana/grafana"
         version = ">= 2.9.0"
      }
   }
}

provider "grafana" {
  url  = "http://localhost:3000/"
  auth = "admin:admin"
}

resource "grafana_organization" "swks" {
  name = "swks"
}

resource "grafana_folder" "swks_test_folder" {
  org_id = grafana_organization.swks.org_id
  provider = grafana
  title  = "Test Folder"
}

resource "grafana_dashboard" "swks_test_folder" {
  org_id = grafana_organization.swks.org_id
  folder = grafana_folder.swks_test_folder.id
  overwrite = true
  config_json = jsonencode({
    "title" : "My Dashboard Title",
    "uid" : "my-dashboard-uid"
  })
}