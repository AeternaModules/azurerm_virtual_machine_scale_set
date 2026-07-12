variable "virtual_machine_scale_sets" {
  description = <<EOT
Map of virtual_machine_scale_sets, attributes below
Required:
    - location
    - name
    - resource_group_name
    - upgrade_policy_mode
    - network_profile (block):
        - accelerated_networking (optional)
        - dns_settings (optional, block):
            - dns_servers (required)
        - ip_configuration (required, block):
            - application_gateway_backend_address_pool_ids (optional)
            - application_security_group_ids (optional)
            - load_balancer_backend_address_pool_ids (optional)
            - load_balancer_inbound_nat_rules_ids (optional)
            - name (required)
            - primary (required)
            - public_ip_address_configuration (optional, block):
                - domain_name_label (required)
                - idle_timeout (required)
                - name (required)
            - subnet_id (required)
        - ip_forwarding (optional)
        - name (required)
        - network_security_group_id (optional)
        - primary (required)
    - os_profile (block):
        - admin_password (optional)
        - admin_username (required)
        - computer_name_prefix (required)
        - custom_data (optional)
    - sku (block):
        - capacity (required)
        - name (required)
        - tier (optional)
    - storage_profile_os_disk (block):
        - caching (optional)
        - create_option (required)
        - image (optional)
        - managed_disk_type (optional)
        - name (optional)
        - os_type (optional)
        - vhd_containers (optional)
Optional:
    - automatic_os_upgrade
    - eviction_policy
    - health_probe_id
    - license_type
    - overprovision
    - priority
    - proximity_placement_group_id
    - single_placement_group
    - tags
    - zones
    - boot_diagnostics (block):
        - enabled (optional)
        - storage_uri (required)
    - extension (block):
        - auto_upgrade_minor_version (optional)
        - name (required)
        - protected_settings (optional)
        - provision_after_extensions (optional)
        - publisher (required)
        - settings (optional)
        - type (required)
        - type_handler_version (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - os_profile_linux_config (block):
        - disable_password_authentication (optional)
        - ssh_keys (optional, block):
            - key_data (optional)
            - path (required)
    - os_profile_secrets (block):
        - source_vault_id (required)
        - vault_certificates (optional, block):
            - certificate_store (optional)
            - certificate_url (required)
    - os_profile_windows_config (block):
        - additional_unattend_config (optional, block):
            - component (required)
            - content (required)
            - pass (required)
            - setting_name (required)
        - enable_automatic_upgrades (optional)
        - provision_vm_agent (optional)
        - winrm (optional, block):
            - certificate_url (optional)
            - protocol (required)
    - plan (block):
        - name (required)
        - product (required)
        - publisher (required)
    - rolling_upgrade_policy (block):
        - max_batch_instance_percent (optional)
        - max_unhealthy_instance_percent (optional)
        - max_unhealthy_upgraded_instance_percent (optional)
        - pause_time_between_batches (optional)
    - storage_profile_data_disk (block):
        - caching (optional)
        - create_option (required)
        - disk_size_gb (optional)
        - lun (required)
        - managed_disk_type (optional)
    - storage_profile_image_reference (block):
        - id (optional)
        - offer (optional)
        - publisher (optional)
        - sku (optional)
        - version (optional)
EOT

  type = map(object({
    location                     = string
    name                         = string
    resource_group_name          = string
    upgrade_policy_mode          = string
    automatic_os_upgrade         = optional(bool) # Default: false
    eviction_policy              = optional(string)
    health_probe_id              = optional(string)
    license_type                 = optional(string)
    overprovision                = optional(bool) # Default: true
    priority                     = optional(string)
    proximity_placement_group_id = optional(string)
    single_placement_group       = optional(bool) # Default: true
    tags                         = optional(map(string))
    zones                        = optional(list(string))
    network_profile = list(object({
      accelerated_networking = optional(bool)
      dns_settings = optional(object({
        dns_servers = list(string)
      }))
      ip_configuration = list(object({
        application_gateway_backend_address_pool_ids = optional(set(string))
        application_security_group_ids               = optional(set(string))
        load_balancer_backend_address_pool_ids       = optional(set(string))
        load_balancer_inbound_nat_rules_ids          = optional(set(string))
        name                                         = string
        primary                                      = bool
        public_ip_address_configuration = optional(object({
          domain_name_label = string
          idle_timeout      = number
          name              = string
        }))
        subnet_id = string
      }))
      ip_forwarding             = optional(bool) # Default: false
      name                      = string
      network_security_group_id = optional(string)
      primary                   = bool
    }))
    os_profile = object({
      admin_password       = optional(string)
      admin_username       = string
      computer_name_prefix = string
      custom_data          = optional(string)
    })
    sku = object({
      capacity = number
      name     = string
      tier     = optional(string)
    })
    storage_profile_os_disk = object({
      caching           = optional(string)
      create_option     = string
      image             = optional(string)
      managed_disk_type = optional(string)
      name              = optional(string)
      os_type           = optional(string)
      vhd_containers    = optional(set(string))
    })
    boot_diagnostics = optional(object({
      enabled     = optional(bool) # Default: true
      storage_uri = string
    }))
    extension = optional(list(object({
      auto_upgrade_minor_version = optional(bool)
      name                       = string
      protected_settings         = optional(string)
      provision_after_extensions = optional(set(string))
      publisher                  = string
      settings                   = optional(string)
      type                       = string
      type_handler_version       = string
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    os_profile_linux_config = optional(object({
      disable_password_authentication = optional(bool) # Default: false
      ssh_keys = optional(list(object({
        key_data = optional(string)
        path     = string
      })))
    }))
    os_profile_secrets = optional(list(object({
      source_vault_id = string
      vault_certificates = optional(list(object({
        certificate_store = optional(string)
        certificate_url   = string
      })))
    })))
    os_profile_windows_config = optional(object({
      additional_unattend_config = optional(list(object({
        component    = string
        content      = string
        pass         = string
        setting_name = string
      })))
      enable_automatic_upgrades = optional(bool)
      provision_vm_agent        = optional(bool)
      winrm = optional(list(object({
        certificate_url = optional(string)
        protocol        = string
      })))
    }))
    plan = optional(object({
      name      = string
      product   = string
      publisher = string
    }))
    rolling_upgrade_policy = optional(object({
      max_batch_instance_percent              = optional(number) # Default: 20
      max_unhealthy_instance_percent          = optional(number) # Default: 20
      max_unhealthy_upgraded_instance_percent = optional(number) # Default: 20
      pause_time_between_batches              = optional(string) # Default: "PT0S"
    }))
    storage_profile_data_disk = optional(list(object({
      caching           = optional(string)
      create_option     = string
      disk_size_gb      = optional(number)
      lun               = number
      managed_disk_type = optional(string)
    })))
    storage_profile_image_reference = optional(object({
      id        = optional(string)
      offer     = optional(string)
      publisher = optional(string)
      sku       = optional(string)
      version   = optional(string)
    }))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_machine_scale_set's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: zones[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: sku.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sku.capacity
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: license_type
  #   condition: contains(["Windows_Client", "Windows_Server"], value)
  #   message:   must be one of: Windows_Client, Windows_Server
  # path: upgrade_policy_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: health_probe_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: health_probe_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: rolling_upgrade_policy.max_batch_instance_percent
  #   condition: value >= 5 && value <= 100
  #   message:   must be between 5 and 100
  # path: rolling_upgrade_policy.max_unhealthy_instance_percent
  #   condition: value >= 5 && value <= 100
  #   message:   must be between 5 and 100
  # path: rolling_upgrade_policy.max_unhealthy_upgraded_instance_percent
  #   condition: value >= 5 && value <= 100
  #   message:   must be between 5 and 100
  # path: rolling_upgrade_policy.pause_time_between_batches
  #   source:    [from validate.ISO8601Duration] !ok
  # path: rolling_upgrade_policy.pause_time_between_batches
  #   source:    [from validate.ISO8601Duration] err != nil
  # path: priority
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: eviction_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: os_profile.admin_username
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: os_profile.admin_password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: os_profile_secrets.source_vault_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: os_profile_secrets.source_vault_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: network_profile.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: network_profile.network_security_group_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: network_profile.network_security_group_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: network_profile.dns_settings.dns_servers[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: network_profile.ip_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: network_profile.ip_configuration.subnet_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: network_profile.ip_configuration.subnet_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: network_profile.ip_configuration.application_security_group_ids[*]
  #   source:    [from azure.ValidateResourceID] !ok
  # path: network_profile.ip_configuration.application_security_group_ids[*]
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: network_profile.ip_configuration.public_ip_address_configuration.idle_timeout
  #   condition: value >= 4 && value <= 32
  #   message:   must be between 4 and 32
  # path: storage_profile_os_disk.managed_disk_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_profile_data_disk.disk_size_gb
  #   source:    [from validate2.DiskSizeGB] value < 0 || value > 32767
  # path: storage_profile_data_disk.managed_disk_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: extension.provision_after_extensions[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: extension.settings
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: extension.protected_settings
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

