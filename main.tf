terraform {
   required_providers {
      grafana = {
         source  = "grafana/grafana"
         version = ">= 2.9.0"
      }
   }
}

provider "grafana" {
  url  = "https://3094-2803-9800-9015-5500-29ad-6acf-b1d2-d0b2.ngrok-free.app/"
  auth = "admin:admin"
}

resource "grafana_organization" "test" {
  name = "test"
}

resource "grafana_folder" "test_folder" {
  provider = grafana
  org_id = grafana_organization.test.org_id
  title  = "Test Folder"
}