provider "alicloud" {
  region = "cn-hangzhou"
}
data "alicloud_vpcs" "default" {
  is_default = true
}

resource "alicloud_security_group" "demo" {
  count = 2
  name = "cloud-demo-test-${count.index}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}
provider "aws" {
  region = "us-west-1"
}
data "aws_vpcs" "default" {}