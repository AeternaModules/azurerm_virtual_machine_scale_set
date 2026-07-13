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
    automatic_os_upgrade         = optional(bool)
    eviction_policy              = optional(string)
    health_probe_id              = optional(string)
    license_type                 = optional(string)
    overprovision                = optional(bool)
    priority                     = optional(string)
    proximity_placement_group_id = optional(string)
    single_placement_group       = optional(bool)
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
      ip_forwarding             = optional(bool)
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
      enabled     = optional(bool)
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
      disable_password_authentication = optional(bool)
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
      max_batch_instance_percent              = optional(number)
      max_unhealthy_instance_percent          = optional(number)
      max_unhealthy_upgraded_instance_percent = optional(number)
      pause_time_between_batches              = optional(string)
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
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        length(v.network_profile) >= 1
      )
    ])
    error_message = "Each network_profile list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        alltrue([for item in v.network_profile : (length(item.ip_configuration) >= 1)])
      )
    ])
    error_message = "Each ip_configuration list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.zones == null || (alltrue([for x in v.zones : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        length(v.sku.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.sku.capacity >= 0
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.license_type == null || (contains(["Windows_Client", "Windows_Server"], v.license_type))
      )
    ])
    error_message = "must be one of: Windows_Client, Windows_Server"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.rolling_upgrade_policy == null || (v.rolling_upgrade_policy.max_batch_instance_percent == null || (v.rolling_upgrade_policy.max_batch_instance_percent >= 5 && v.rolling_upgrade_policy.max_batch_instance_percent <= 100))
      )
    ])
    error_message = "must be between 5 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.rolling_upgrade_policy == null || (v.rolling_upgrade_policy.max_unhealthy_instance_percent == null || (v.rolling_upgrade_policy.max_unhealthy_instance_percent >= 5 && v.rolling_upgrade_policy.max_unhealthy_instance_percent <= 100))
      )
    ])
    error_message = "must be between 5 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.rolling_upgrade_policy == null || (v.rolling_upgrade_policy.max_unhealthy_upgraded_instance_percent == null || (v.rolling_upgrade_policy.max_unhealthy_upgraded_instance_percent >= 5 && v.rolling_upgrade_policy.max_unhealthy_upgraded_instance_percent <= 100))
      )
    ])
    error_message = "must be between 5 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        length(v.os_profile.admin_username) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.os_profile.admin_password == null || (length(v.os_profile.admin_password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        alltrue([for item in v.network_profile : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        alltrue([for item in v.network_profile : (item.dns_settings == null || (alltrue([for x in item.dns_settings.dns_servers : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        alltrue([for item in v.network_profile : (alltrue([for item in item.ip_configuration : (length(item.name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        alltrue([for item in v.network_profile : (alltrue([for item in item.ip_configuration : (item.public_ip_address_configuration == null || (item.public_ip_address_configuration.idle_timeout >= 4 && item.public_ip_address_configuration.idle_timeout <= 32))]))])
      )
    ])
    error_message = "must be between 4 and 32"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.extension == null || alltrue([for item in v.extension : (item.provision_after_extensions == null || (alltrue([for x in item.provision_after_extensions : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.extension == null || alltrue([for item in v.extension : (item.settings == null || (can(jsondecode(item.settings))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.extension == null || alltrue([for item in v.extension : (item.protected_settings == null || (can(jsondecode(item.protected_settings))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_scale_sets : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 26 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

