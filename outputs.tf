output "virtual_machine_scale_sets_id" {
  description = "Map of id values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "virtual_machine_scale_sets_automatic_os_upgrade" {
  description = "Map of automatic_os_upgrade values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.automatic_os_upgrade if v.automatic_os_upgrade != null }
}
output "virtual_machine_scale_sets_boot_diagnostics" {
  description = "Map of boot_diagnostics values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.boot_diagnostics if v.boot_diagnostics != null && length(v.boot_diagnostics) > 0 }
}
output "virtual_machine_scale_sets_eviction_policy" {
  description = "Map of eviction_policy values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.eviction_policy if v.eviction_policy != null && length(v.eviction_policy) > 0 }
}
output "virtual_machine_scale_sets_extension" {
  description = "Map of extension values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.extension if v.extension != null && length(v.extension) > 0 }
  sensitive   = true
}
output "virtual_machine_scale_sets_health_probe_id" {
  description = "Map of health_probe_id values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.health_probe_id if v.health_probe_id != null && length(v.health_probe_id) > 0 }
}
output "virtual_machine_scale_sets_identity" {
  description = "Map of identity values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "virtual_machine_scale_sets_license_type" {
  description = "Map of license_type values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.license_type if v.license_type != null && length(v.license_type) > 0 }
}
output "virtual_machine_scale_sets_location" {
  description = "Map of location values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.location if v.location != null && length(v.location) > 0 }
}
output "virtual_machine_scale_sets_name" {
  description = "Map of name values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "virtual_machine_scale_sets_network_profile" {
  description = "Map of network_profile values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.network_profile if v.network_profile != null && length(v.network_profile) > 0 }
}
output "virtual_machine_scale_sets_os_profile" {
  description = "Map of os_profile values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile if v.os_profile != null && length(v.os_profile) > 0 }
  sensitive   = true
}
output "virtual_machine_scale_sets_os_profile_linux_config" {
  description = "Map of os_profile_linux_config values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile_linux_config if v.os_profile_linux_config != null && length(v.os_profile_linux_config) > 0 }
}
output "virtual_machine_scale_sets_os_profile_secrets" {
  description = "Map of os_profile_secrets values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile_secrets if v.os_profile_secrets != null && length(v.os_profile_secrets) > 0 }
}
output "virtual_machine_scale_sets_os_profile_windows_config" {
  description = "Map of os_profile_windows_config values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile_windows_config if v.os_profile_windows_config != null && length(v.os_profile_windows_config) > 0 }
  sensitive   = true
}
output "virtual_machine_scale_sets_overprovision" {
  description = "Map of overprovision values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.overprovision if v.overprovision != null }
}
output "virtual_machine_scale_sets_plan" {
  description = "Map of plan values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.plan if v.plan != null && length(v.plan) > 0 }
}
output "virtual_machine_scale_sets_priority" {
  description = "Map of priority values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.priority if v.priority != null && length(v.priority) > 0 }
}
output "virtual_machine_scale_sets_proximity_placement_group_id" {
  description = "Map of proximity_placement_group_id values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.proximity_placement_group_id if v.proximity_placement_group_id != null && length(v.proximity_placement_group_id) > 0 }
}
output "virtual_machine_scale_sets_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "virtual_machine_scale_sets_rolling_upgrade_policy" {
  description = "Map of rolling_upgrade_policy values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.rolling_upgrade_policy if v.rolling_upgrade_policy != null && length(v.rolling_upgrade_policy) > 0 }
}
output "virtual_machine_scale_sets_single_placement_group" {
  description = "Map of single_placement_group values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.single_placement_group if v.single_placement_group != null }
}
output "virtual_machine_scale_sets_sku" {
  description = "Map of sku values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "virtual_machine_scale_sets_storage_profile_data_disk" {
  description = "Map of storage_profile_data_disk values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.storage_profile_data_disk if v.storage_profile_data_disk != null && length(v.storage_profile_data_disk) > 0 }
}
output "virtual_machine_scale_sets_storage_profile_image_reference" {
  description = "Map of storage_profile_image_reference values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.storage_profile_image_reference if v.storage_profile_image_reference != null && length(v.storage_profile_image_reference) > 0 }
}
output "virtual_machine_scale_sets_storage_profile_os_disk" {
  description = "Map of storage_profile_os_disk values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.storage_profile_os_disk if v.storage_profile_os_disk != null && length(v.storage_profile_os_disk) > 0 }
}
output "virtual_machine_scale_sets_tags" {
  description = "Map of tags values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "virtual_machine_scale_sets_upgrade_policy_mode" {
  description = "Map of upgrade_policy_mode values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.upgrade_policy_mode if v.upgrade_policy_mode != null && length(v.upgrade_policy_mode) > 0 }
}
output "virtual_machine_scale_sets_zones" {
  description = "Map of zones values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.zones if v.zones != null && length(v.zones) > 0 }
}

