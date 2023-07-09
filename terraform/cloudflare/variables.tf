variable "cf_zone_id" {
  description = "Cloudflare zone ID"
  type        = string
}

variable "cf_api_token" {
  description = "Cloudflare DNS API token"
  sensitive   = true
  type        = string
}

variable "cf_dns_records" {
  type = list(object({
    name            = string
    priority        = optional(number)
    data            = optional(map(object({
      service  = string
      proto    = string
      name     = string
      priority = number
      weight   = number
      port     = number
      target   = string
    })))
    proxied         = optional(bool, true)
    type            = string
    value           = string
    ttl             = optional(number)
    allow_overwrite = optional(bool, true)
  }))
}
