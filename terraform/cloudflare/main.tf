resource "cloudflare_record" "record" {
  for_each = {
    for index, record in var.cf_dns_records : "${record.name};${record.value};${record.type}" => record
  }

  zone_id         = var.cf_zone_id
  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  proxied         = each.value.proxied
  allow_overwrite = each.value.allow_overwrite
}
