resource "grafana_dashboard" "test" {
  provider = grafana
  folder = grafana_folder.swks_test_folder.id
  overwrite = true
  org_id = grafana_organization.swks.org_id
  for_each    = fileset("${path.module}/templates/dashboards", "*.json")
  config_json = file("${path.module}/templates/dashboards/${each.key}")
}
