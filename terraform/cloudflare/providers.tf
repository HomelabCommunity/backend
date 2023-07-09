terraform {
  cloud {
    organization = "homelab_community"
    workspaces {
      name = "cloudflare"
    }
  }
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4.9.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cf_api_token
}
