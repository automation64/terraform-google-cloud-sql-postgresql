locals {
  #
  # Shared
  #

  shared__labels = {
    at64_shared__automated      = "true"
    at64_shared__module_type    = "terraform"
    at64_shared__module_name    = "terraform-google-cloud-sql-postgresql"
    at64_shared__module_version = "1-0-0"
  }

  shared__prefix = {
    google_sql_database_instance = coalesce(var.shared__prefix.google_sql_database_instance, module.lib_catalog.pgg.sql_psql_instance)
    google_sql_database          = coalesce(var.shared__prefix.google_sql_database, module.lib_catalog.pgg.sql_database)
    google_sql_user              = coalesce(var.shared__prefix.google_sql_user, module.lib_catalog.pgg.sql_user)
  }

  shared__name_instance = "${var.shared__name}-${format("%04d", random_integer.main.result)}"

  #
  # Google SQL Database Instance
  #

  google_sql_database_instance = {
    final_backup_description = var.google_sql_database_instance__settings.final_backup_config.enabled ? "${local.shared__prefix.google_sql_database_instance}-${local.shared__name_instance}-final" : null

    database_version = "POSTGRES_${var.google_sql_database_instance.database_version_number}"
    name             = "${local.shared__prefix.google_sql_database_instance}-${local.shared__name_instance}"
  }

  google_sql_database_instance__settings = {
    activation_policy        = "ALWAYS"
    availability_type        = "ZONAL"
    connector_enforcement    = "REQUIRED"
    data_api_access          = "DISALLOW_DATA_API"
    disk_autoresize          = true
    retain_backups_on_delete = true

    database_flags = [
      {
        name  = "cloudsql.iam_authentication"
        value = "on"
      },
    ]

    ip_configuration = {
      enable_private_path_for_google_cloud_services = true
      ipv4_enabled                                  = false
      server_ca_mode                                = "GOOGLE_MANAGED_INTERNAL_CA"
      ssl_mode                                      = "ENCRYPTED_ONLY"
    }

    backup_configuration = {
      enabled                        = true
      point_in_time_recovery_enabled = true
    }

    final_backup_config = {
      retention_days = var.google_sql_database_instance__settings.final_backup_config.enabled ? var.google_sql_database_instance__settings.final_backup_config.retention_days : null
    }

    insights_config = {
      enhanced_query_insights_enabled = var.google_sql_database_instance__settings.edition == "ENTERPRISE_PLUS" ? true : false
      query_insights_enabled          = var.google_sql_database_instance__settings.edition == "ENTERPRISE_PLUS" ? true : false
    }

    labels = merge(
      local.shared__labels,
      var.shared__labels
    )
  }

  #
  # Google SQL User
  #

  google_sql_user = {
    dba = {
      name            = "${local.shared__prefix.google_sql_user}-${local.shared__name_instance}-dba"
      deletion_policy = null
      type            = "BUILT_IN"
      database_roles  = ["cloudsqlsuperuser"]
    }
  }

  #
  # Module Google Secret Manager Password
  #

  google_secret_manager_password = {
    dba = {
      name                = "${var.shared__name}-dba"
      deletion_protection = false
    }
  }
}
