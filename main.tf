provider "alicloud" {
  region = "cn-hangzhou"
}
data "alicloud_vpcs" "default" {
  is_default = true
}

resource "alicloud_security_group" "demo" {
  count = 4
  name = "cloud-demo-test-${count.index}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}
