resource "google_sql_database_instance" "main" {
  deletion_protection = var.shared__allow_delete
  project             = var.shared__project_id
  region              = var.shared__location

  database_version         = local.google_sql_database_instance.database_version
  final_backup_description = local.google_sql_database_instance.final_backup_description
  name                     = local.google_sql_database_instance.name

  root_password_wo         = data.google_secret_manager_secret_version_access.dba.secret_data
  root_password_wo_version = data.google_secret_manager_secret_version_access.dba.version

  settings {
    deletion_protection_enabled  = var.shared__allow_delete
    disk_autoresize_limit        = var.google_sql_database_instance__settings.disk_autoresize_limit
    disk_type                    = var.google_sql_database_instance__settings.disk_type
    edition                      = var.google_sql_database_instance__settings.edition
    enable_dataplex_integration  = var.google_sql_database_instance__settings.enable_dataplex_integration
    enable_google_ml_integration = var.google_sql_database_instance__settings.enable_google_ml_integration
    tier                         = var.google_sql_database_instance__settings.tier

    activation_policy        = local.google_sql_database_instance__settings.activation_policy
    availability_type        = local.google_sql_database_instance__settings.availability_type
    connector_enforcement    = local.google_sql_database_instance__settings.connector_enforcement
    data_api_access          = local.google_sql_database_instance__settings.data_api_access
    disk_autoresize          = local.google_sql_database_instance__settings.disk_autoresize
    retain_backups_on_delete = local.google_sql_database_instance__settings.retain_backups_on_delete
    user_labels              = local.google_sql_database_instance__settings.labels

    ip_configuration {
      allocated_ip_range = var.google_sql_database_instance__settings.ip_configuration.allocated_ip_range
      private_network    = var.google_sql_database_instance__settings.ip_configuration.private_network

      enable_private_path_for_google_cloud_services = local.google_sql_database_instance__settings.ip_configuration.enable_private_path_for_google_cloud_services
      ipv4_enabled                                  = local.google_sql_database_instance__settings.ip_configuration.ipv4_enabled
      server_ca_mode                                = local.google_sql_database_instance__settings.ip_configuration.server_ca_mode
      ssl_mode                                      = local.google_sql_database_instance__settings.ip_configuration.ssl_mode
    }

    final_backup_config {
      enabled = var.google_sql_database_instance__settings.final_backup_config.enabled

      retention_days = local.google_sql_database_instance__settings.final_backup_config.retention_days
    }

    maintenance_window {
      day  = var.google_sql_database_instance__settings.maintenance_window.day
      hour = var.google_sql_database_instance__settings.maintenance_window.hour
    }

    backup_configuration {
      location                       = var.google_sql_database_instance__settings.backup_configuration.location
      start_time                     = var.google_sql_database_instance__settings.backup_configuration.start_time
      transaction_log_retention_days = var.google_sql_database_instance__settings.backup_configuration.transaction_log_retention_days

      enabled                        = local.google_sql_database_instance__settings.backup_configuration.enabled
      point_in_time_recovery_enabled = local.google_sql_database_instance__settings.backup_configuration.point_in_time_recovery_enabled

      backup_retention_settings {
        retained_backups = var.google_sql_database_instance__settings.backup_retention_settings.retained_backups
        retention_unit   = var.google_sql_database_instance__settings.backup_retention_settings.retention_unit
      }
    }

    insights_config {
      enhanced_query_insights_enabled = local.google_sql_database_instance__settings.insights_config.enhanced_query_insights_enabled
      query_insights_enabled          = local.google_sql_database_instance__settings.insights_config.query_insights_enabled
    }

    dynamic "database_flags" {
      for_each = local.google_sql_database_instance__settings.database_flags
      content {
        name  = lookup(database_flags.value, "name", null)
        value = lookup(database_flags.value, "value", null)
      }
    }
  }

  timeouts {
    create = "${var.opentofu__timeouts_minutes.create}m"
    delete = "${var.opentofu__timeouts_minutes.delete}m"
    update = "${var.opentofu__timeouts_minutes.update}m"
  }

  lifecycle {
    ignore_changes = [
      root_password_wo,
      root_password_wo_version,
      settings[0].disk_size,
      settings[0].maintenance_window
    ]
  }
  depends_on = [
    module.google_secret_manager_password__dba
  ]
}
