resource "grafana_dashboard" "test" {
  provider = grafana
  org_id = grafana_organization.swks.org_id
  folder = grafana_folder.swks_test_folder.id
  overwrite = true
  for_each    = fileset("${path.module}/dashboards", "*.json")
  config_json = file("${path.module}/dashboards/${each.key}")
}
