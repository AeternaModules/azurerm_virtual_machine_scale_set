output "virtual_machine_scale_sets_automatic_os_upgrade" {
  description = "Map of automatic_os_upgrade values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.automatic_os_upgrade }
}
output "virtual_machine_scale_sets_boot_diagnostics" {
  description = "Map of boot_diagnostics values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.boot_diagnostics }
}
output "virtual_machine_scale_sets_eviction_policy" {
  description = "Map of eviction_policy values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.eviction_policy }
}
output "virtual_machine_scale_sets_extension" {
  description = "Map of extension values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.extension }
  sensitive   = true
}
output "virtual_machine_scale_sets_health_probe_id" {
  description = "Map of health_probe_id values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.health_probe_id }
}
output "virtual_machine_scale_sets_identity" {
  description = "Map of identity values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.identity }
}
output "virtual_machine_scale_sets_license_type" {
  description = "Map of license_type values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.license_type }
}
output "virtual_machine_scale_sets_location" {
  description = "Map of location values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.location }
}
output "virtual_machine_scale_sets_name" {
  description = "Map of name values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.name }
}
output "virtual_machine_scale_sets_network_profile" {
  description = "Map of network_profile values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.network_profile }
}
output "virtual_machine_scale_sets_os_profile" {
  description = "Map of os_profile values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile }
  sensitive   = true
}
output "virtual_machine_scale_sets_os_profile_linux_config" {
  description = "Map of os_profile_linux_config values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile_linux_config }
}
output "virtual_machine_scale_sets_os_profile_secrets" {
  description = "Map of os_profile_secrets values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile_secrets }
}
output "virtual_machine_scale_sets_os_profile_windows_config" {
  description = "Map of os_profile_windows_config values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.os_profile_windows_config }
  sensitive   = true
}
output "virtual_machine_scale_sets_overprovision" {
  description = "Map of overprovision values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.overprovision }
}
output "virtual_machine_scale_sets_plan" {
  description = "Map of plan values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.plan }
}
output "virtual_machine_scale_sets_priority" {
  description = "Map of priority values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.priority }
}
output "virtual_machine_scale_sets_proximity_placement_group_id" {
  description = "Map of proximity_placement_group_id values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.proximity_placement_group_id }
}
output "virtual_machine_scale_sets_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.resource_group_name }
}
output "virtual_machine_scale_sets_rolling_upgrade_policy" {
  description = "Map of rolling_upgrade_policy values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.rolling_upgrade_policy }
}
output "virtual_machine_scale_sets_single_placement_group" {
  description = "Map of single_placement_group values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.single_placement_group }
}
output "virtual_machine_scale_sets_sku" {
  description = "Map of sku values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.sku }
}
output "virtual_machine_scale_sets_storage_profile_data_disk" {
  description = "Map of storage_profile_data_disk values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.storage_profile_data_disk }
}
output "virtual_machine_scale_sets_storage_profile_image_reference" {
  description = "Map of storage_profile_image_reference values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.storage_profile_image_reference }
}
output "virtual_machine_scale_sets_storage_profile_os_disk" {
  description = "Map of storage_profile_os_disk values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.storage_profile_os_disk }
}
output "virtual_machine_scale_sets_tags" {
  description = "Map of tags values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.tags }
}
output "virtual_machine_scale_sets_upgrade_policy_mode" {
  description = "Map of upgrade_policy_mode values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.upgrade_policy_mode }
}
output "virtual_machine_scale_sets_zones" {
  description = "Map of zones values across all virtual_machine_scale_sets, keyed the same as var.virtual_machine_scale_sets"
  value       = { for k, v in azurerm_virtual_machine_scale_set.virtual_machine_scale_sets : k => v.zones }
}

