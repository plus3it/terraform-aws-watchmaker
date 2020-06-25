locals {
  full_build_id  = var.build_id == null ? format("notcb:%s", uuid()) : var.build_id                                                           #128-bit rfc 4122 v4 UUID
  build_id       = "${substr(element(split(":", local.full_build_id), 1), 0, 8)}${substr(element(split(":", local.full_build_id), 1), 9, 4)}" #extract node portion of uuid (last 6 octets) for brevity
  test_prefix    = "tf-wam-test-${local.build_id}"
  keypair_name   = var.keypair_name == null ? aws_key_pair.this.id : var.keypair_name
  security_group = var.security_group == null ? aws_security_group.this.id : var.security_group
  kmskey_id      = var.kmskey_id == null ? aws_kms_key.this.key_id : var.kmskey_id
}
