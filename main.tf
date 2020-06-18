data "alicloud_regions" "default" {}
output "regions" {
  value = data.alicloud_regions.default.ids
}

resource "alicloud_vpc" "default" {
  cidr_block = "172.16.0.0/16"
  name = "terraform-demo"
}