output "dns_policies_id" {
  description = "Map of id values across all dns_policies, keyed the same as var.dns_policies except keys with no id are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dns_policies_alternative_name_server_config" {
  description = "Map of alternative_name_server_config values across all dns_policies, keyed the same as var.dns_policies except keys with no alternative_name_server_config are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => one(v.alternative_name_server_config) if v.alternative_name_server_config != null && length(v.alternative_name_server_config) > 0 }
}
output "dns_policies_deletion_policy" {
  description = "Map of deletion_policy values across all dns_policies, keyed the same as var.dns_policies except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dns_policies_description" {
  description = "Map of description values across all dns_policies, keyed the same as var.dns_policies except keys with no description are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.description if v.description != null && length(v.description) > 0 }
}
output "dns_policies_dns64_config" {
  description = "Map of dns64_config values across all dns_policies, keyed the same as var.dns_policies except keys with no dns64_config are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => one(v.dns64_config) if v.dns64_config != null && length(v.dns64_config) > 0 }
}
output "dns_policies_enable_inbound_forwarding" {
  description = "Map of enable_inbound_forwarding values across all dns_policies, keyed the same as var.dns_policies except keys with no enable_inbound_forwarding are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.enable_inbound_forwarding if v.enable_inbound_forwarding != null }
}
output "dns_policies_enable_logging" {
  description = "Map of enable_logging values across all dns_policies, keyed the same as var.dns_policies except keys with no enable_logging are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.enable_logging if v.enable_logging != null }
}
output "dns_policies_name" {
  description = "Map of name values across all dns_policies, keyed the same as var.dns_policies except keys with no name are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dns_policies_networks" {
  description = "Map of networks values across all dns_policies, keyed the same as var.dns_policies except keys with no networks are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.networks if v.networks != null && length(v.networks) > 0 }
}
output "dns_policies_project" {
  description = "Map of project values across all dns_policies, keyed the same as var.dns_policies except keys with no project are omitted"
  value       = { for k, v in google_dns_policy.dns_policies : k => v.project if v.project != null && length(v.project) > 0 }
}

