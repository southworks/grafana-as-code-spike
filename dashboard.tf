resource "grafana_dashboard" "test_dashboard" {
  provider = grafana
  folder = grafana_folder.test_folder.id
  overwrite = true
  org_id = grafana_organization.test.org_id
  for_each    = fileset("${path.module}/templates/dashboards", "*.json")
  config_json = file("${path.module}/templates/dashboards/${each.key}")
}
