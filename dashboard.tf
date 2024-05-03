resource "grafana_dashboard" "test" {
  depends_on = [ grafana_cloud_stack_service_account_token.cloud_sa_token ]
  provider = grafana.my_stack
  folder = grafana_folder.swks_test_folder.id
  overwrite = true
  org_id = grafana_organization.swks.org_id
  for_each    = fileset("${path.module}/templates/dashboards", "*.json")
  config_json = file("${path.module}/templates/dashboards/${each.key}")
}
