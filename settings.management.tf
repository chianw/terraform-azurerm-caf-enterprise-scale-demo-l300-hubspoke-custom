# Configure the management resources settings.
locals {
  configure_management_resources = {
    settings = {
      log_analytics = {
        enabled = true
        config = {
          retention_in_days                                 = var.log_retention_in_days
          enable_monitoring_for_vm                          = true
          enable_monitoring_for_vmss                        = true
          enable_solution_for_agent_health_assessment       = true
          enable_solution_for_anti_malware                  = false
          enable_solution_for_change_tracking               = false
          enable_solution_for_service_map                   = false
          enable_solution_for_sql_assessment                = false
          enable_solution_for_sql_vulnerability_assessment  = false
          enable_solution_for_sql_advanced_threat_detection = false
          enable_solution_for_updates                       = false
          enable_solution_for_vm_insights                   = true
          enable_sentinel                                   = false
        }
      }
      security_center = {
        enabled = false
        config = {
          email_security_contact             = var.security_alerts_email_address
          enable_defender_for_app_services   = true
          enable_defender_for_arm            = true
          enable_defender_for_containers     = true
          enable_defender_for_dns            = true
          enable_defender_for_key_vault      = true
          enable_defender_for_oss_databases  = true
          enable_defender_for_servers        = true
          enable_defender_for_sql_servers    = true
          enable_defender_for_sql_server_vms = true
          enable_defender_for_storage        = true
        }
      }
    }

    location = var.management_resources_location
    tags     = var.management_resources_tags
    advanced = null
  }
}