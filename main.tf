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
  auth = "glsa_6SPt27TdAHxRtdOu5DVNUuEdQA7aw8EQ_241e1796"
}

resource "grafana_organization" "test" {
  name = "test"
}

resource "grafana_folder" "test_folder" {
  provider = grafana
  org_id = grafana_organization.test.org_id
  title  = "Test Folder"
}