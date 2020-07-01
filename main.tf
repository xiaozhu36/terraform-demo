provider "alicloud" {
  region = "cn-hangzhou"
}
data "alicloud_vpcs" "default" {
  is_default = true
}

resource "alicloud_security_group" "demo" {
  name = "cloud-demo-test"
  vpc_id = data.alicloud_vpcs.default.ids.0
}