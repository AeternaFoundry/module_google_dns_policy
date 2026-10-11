variable "dns_policies" {
  description = <<EOT
Map of dns_policies, attributes below
Required:
    - name
Optional:
    - deletion_policy
    - description
    - enable_inbound_forwarding
    - enable_logging
    - project
    - alternative_name_server_config (block):
        - target_name_servers (required, block):
            - forwarding_path (optional)
            - ipv4_address (required)
    - dns64_config (block):
        - scope (required, block):
            - all_queries (optional)
    - networks (block):
        - network_url (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                      = string
    deletion_policy           = optional(string)
    description               = optional(string)
    enable_inbound_forwarding = optional(bool)
    enable_logging            = optional(bool)
    project                   = optional(string)
    alternative_name_server_config = optional(object({
      target_name_servers = list(object({
        forwarding_path = optional(string)
        ipv4_address    = string
      }))
    }))
    dns64_config = optional(object({
      scope = object({
        all_queries = optional(bool)
      })
    }))
    networks = optional(list(object({
      network_url = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dns_policies : (
        v.alternative_name_server_config == null || (length(v.alternative_name_server_config.target_name_servers) >= 1)
      )
    ])
    error_message = "Each target_name_servers list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

