data "alicloud_regions" "default" {}
output "regions" {
  value = data.alicloud_regions.default.ids
}
