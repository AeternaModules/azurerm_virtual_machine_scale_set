resource "azurerm_virtual_machine_scale_set" "virtual_machine_scale_sets" {
  for_each = var.virtual_machine_scale_sets

  location                     = each.value.location
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  upgrade_policy_mode          = each.value.upgrade_policy_mode
  automatic_os_upgrade         = each.value.automatic_os_upgrade
  eviction_policy              = each.value.eviction_policy
  health_probe_id              = each.value.health_probe_id
  license_type                 = each.value.license_type
  overprovision                = each.value.overprovision
  priority                     = each.value.priority
  proximity_placement_group_id = each.value.proximity_placement_group_id
  single_placement_group       = each.value.single_placement_group
  tags                         = each.value.tags
  zones                        = each.value.zones

  network_profile {
    accelerated_networking = each.value.network_profile.accelerated_networking
    dynamic "dns_settings" {
      for_each = each.value.network_profile.dns_settings != null ? [each.value.network_profile.dns_settings] : []
      content {
        dns_servers = dns_settings.value.dns_servers
      }
    }
    ip_configuration {
      application_gateway_backend_address_pool_ids = each.value.network_profile.ip_configuration.application_gateway_backend_address_pool_ids
      application_security_group_ids               = each.value.network_profile.ip_configuration.application_security_group_ids
      load_balancer_backend_address_pool_ids       = each.value.network_profile.ip_configuration.load_balancer_backend_address_pool_ids
      load_balancer_inbound_nat_rules_ids          = each.value.network_profile.ip_configuration.load_balancer_inbound_nat_rules_ids
      name                                         = each.value.network_profile.ip_configuration.name
      primary                                      = each.value.network_profile.ip_configuration.primary
      dynamic "public_ip_address_configuration" {
        for_each = each.value.network_profile.ip_configuration.public_ip_address_configuration != null ? [each.value.network_profile.ip_configuration.public_ip_address_configuration] : []
        content {
          domain_name_label = public_ip_address_configuration.value.domain_name_label
          idle_timeout      = public_ip_address_configuration.value.idle_timeout
          name              = public_ip_address_configuration.value.name
        }
      }
      subnet_id = each.value.network_profile.ip_configuration.subnet_id
    }
    ip_forwarding             = each.value.network_profile.ip_forwarding
    name                      = each.value.network_profile.name
    network_security_group_id = each.value.network_profile.network_security_group_id
    primary                   = each.value.network_profile.primary
  }

  os_profile {
    admin_password       = each.value.os_profile.admin_password
    admin_username       = each.value.os_profile.admin_username
    computer_name_prefix = each.value.os_profile.computer_name_prefix
    custom_data          = each.value.os_profile.custom_data
  }

  sku {
    capacity = each.value.sku.capacity
    name     = each.value.sku.name
    tier     = each.value.sku.tier
  }

  storage_profile_os_disk {
    caching           = each.value.storage_profile_os_disk.caching
    create_option     = each.value.storage_profile_os_disk.create_option
    image             = each.value.storage_profile_os_disk.image
    managed_disk_type = each.value.storage_profile_os_disk.managed_disk_type
    name              = each.value.storage_profile_os_disk.name
    os_type           = each.value.storage_profile_os_disk.os_type
    vhd_containers    = each.value.storage_profile_os_disk.vhd_containers
  }

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? [each.value.boot_diagnostics] : []
    content {
      enabled     = boot_diagnostics.value.enabled
      storage_uri = boot_diagnostics.value.storage_uri
    }
  }

  dynamic "extension" {
    for_each = each.value.extension != null ? [each.value.extension] : []
    content {
      auto_upgrade_minor_version = extension.value.auto_upgrade_minor_version
      name                       = extension.value.name
      protected_settings         = extension.value.protected_settings
      provision_after_extensions = extension.value.provision_after_extensions
      publisher                  = extension.value.publisher
      settings                   = extension.value.settings
      type                       = extension.value.type
      type_handler_version       = extension.value.type_handler_version
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "os_profile_linux_config" {
    for_each = each.value.os_profile_linux_config != null ? [each.value.os_profile_linux_config] : []
    content {
      disable_password_authentication = os_profile_linux_config.value.disable_password_authentication
      dynamic "ssh_keys" {
        for_each = os_profile_linux_config.value.ssh_keys != null ? [os_profile_linux_config.value.ssh_keys] : []
        content {
          key_data = ssh_keys.value.key_data
          path     = ssh_keys.value.path
        }
      }
    }
  }

  dynamic "os_profile_secrets" {
    for_each = each.value.os_profile_secrets != null ? [each.value.os_profile_secrets] : []
    content {
      source_vault_id = os_profile_secrets.value.source_vault_id
      dynamic "vault_certificates" {
        for_each = os_profile_secrets.value.vault_certificates != null ? [os_profile_secrets.value.vault_certificates] : []
        content {
          certificate_store = vault_certificates.value.certificate_store
          certificate_url   = vault_certificates.value.certificate_url
        }
      }
    }
  }

  dynamic "os_profile_windows_config" {
    for_each = each.value.os_profile_windows_config != null ? [each.value.os_profile_windows_config] : []
    content {
      dynamic "additional_unattend_config" {
        for_each = os_profile_windows_config.value.additional_unattend_config != null ? [os_profile_windows_config.value.additional_unattend_config] : []
        content {
          component    = additional_unattend_config.value.component
          content      = additional_unattend_config.value.content
          pass         = additional_unattend_config.value.pass
          setting_name = additional_unattend_config.value.setting_name
        }
      }
      enable_automatic_upgrades = os_profile_windows_config.value.enable_automatic_upgrades
      provision_vm_agent        = os_profile_windows_config.value.provision_vm_agent
      dynamic "winrm" {
        for_each = os_profile_windows_config.value.winrm != null ? [os_profile_windows_config.value.winrm] : []
        content {
          certificate_url = winrm.value.certificate_url
          protocol        = winrm.value.protocol
        }
      }
    }
  }

  dynamic "plan" {
    for_each = each.value.plan != null ? [each.value.plan] : []
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  dynamic "rolling_upgrade_policy" {
    for_each = each.value.rolling_upgrade_policy != null ? [each.value.rolling_upgrade_policy] : []
    content {
      max_batch_instance_percent              = rolling_upgrade_policy.value.max_batch_instance_percent
      max_unhealthy_instance_percent          = rolling_upgrade_policy.value.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = rolling_upgrade_policy.value.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = rolling_upgrade_policy.value.pause_time_between_batches
    }
  }

  dynamic "storage_profile_data_disk" {
    for_each = each.value.storage_profile_data_disk != null ? [each.value.storage_profile_data_disk] : []
    content {
      caching           = storage_profile_data_disk.value.caching
      create_option     = storage_profile_data_disk.value.create_option
      disk_size_gb      = storage_profile_data_disk.value.disk_size_gb
      lun               = storage_profile_data_disk.value.lun
      managed_disk_type = storage_profile_data_disk.value.managed_disk_type
    }
  }

  dynamic "storage_profile_image_reference" {
    for_each = each.value.storage_profile_image_reference != null ? [each.value.storage_profile_image_reference] : []
    content {
      id        = storage_profile_image_reference.value.id
      offer     = storage_profile_image_reference.value.offer
      publisher = storage_profile_image_reference.value.publisher
      sku       = storage_profile_image_reference.value.sku
      version   = storage_profile_image_reference.value.version
    }
  }
}

