resource "google_dns_policy" "dns_policies" {
  for_each = var.dns_policies

  name                      = each.value.name
  deletion_policy           = each.value.deletion_policy
  description               = each.value.description
  enable_inbound_forwarding = each.value.enable_inbound_forwarding
  enable_logging            = each.value.enable_logging
  project                   = each.value.project

  dynamic "alternative_name_server_config" {
    for_each = each.value.alternative_name_server_config != null ? [each.value.alternative_name_server_config] : []
    content {
      dynamic "target_name_servers" {
        for_each = alternative_name_server_config.value.target_name_servers
        content {
          forwarding_path = target_name_servers.value.forwarding_path
          ipv4_address    = target_name_servers.value.ipv4_address
        }
      }
    }
  }

  dynamic "dns64_config" {
    for_each = each.value.dns64_config != null ? [each.value.dns64_config] : []
    content {
      scope {
        all_queries = dns64_config.value.scope.all_queries
      }
    }
  }

  dynamic "networks" {
    for_each = each.value.networks != null ? each.value.networks : []
    content {
      network_url = networks.value.network_url
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

