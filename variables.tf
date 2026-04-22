#
# Shared
#

variable "shared__name" {
  description = "Name seed to be used for naming generated module objects"
  sensitive   = false
  nullable    = false
  type        = string
}

variable "shared__location" {
  description = "Location where resources will be deployed to"
  sensitive   = false
  nullable    = false
  type        = string
}

variable "shared__prefix" {
  description = "Prefix definition for naming generated module objects"
  sensitive   = false
  nullable    = true
  type = object({
    google_sql_database_instance = optional(string)
    google_sql_database          = optional(string)
    google_sql_user              = optional(string)
  })
  default = {}
}

variable "shared__labels" {
  description = "Common labels to be applied to all resources"
  sensitive   = false
  nullable    = true
  type        = map(string)
  default     = {}
}

variable "shared__project_id" {
  description = "GCP Project ID where resources will be deployed to"
  sensitive   = false
  nullable    = false
  type        = string
}

variable "shared__allow_delete" {
  description = "Allow terraform to delete provisioned resources"
  sensitive   = false
  nullable    = false
  type        = bool
  default     = false
}

variable "opentofu__timeouts_minutes" {
  description = "Opentofu Timeouts"
  sensitive   = false
  nullable    = true
  type = object({
    create = optional(number, 45)
    delete = optional(number, 30)
    update = optional(number, 45)
  })
  default = {}
}

#
# Google SQL Database Instance
#

variable "google_sql_database_instance" {
  description = "GCP Cloud SQL Database Instance attributes"
  sensitive   = false
  nullable    = true
  type = object({
    database_version_number = optional(string, "18")
  })
  default = {}
}

variable "google_sql_database_instance__settings" {
  description = "GCP Cloud SQL Database Instance Settings"
  sensitive   = false
  nullable    = false
  type = object({
    tier                         = optional(string, "db-f1-micro")
    edition                      = optional(string, "ENTERPRISE")
    collation                    = optional(string, "en_US.UTF8")
    enable_google_ml_integration = optional(bool, false)
    enable_dataplex_integration  = optional(bool, false)
    disk_autoresize_limit        = optional(number, 20)
    disk_type                    = optional(string, "PD_HDD")

    ip_configuration = object({
      private_network    = string
      allocated_ip_range = string
    })

    maintenance_window = optional(object({
      day  = optional(number, 7)
      hour = optional(number, 3)
    }), {})

    backup_configuration = optional(object({
      location                       = optional(string)
      start_time                     = optional(string, "01:00")
      transaction_log_retention_days = optional(number, 1)
    }), {})

    backup_retention_settings = optional(object({
      retained_backups = optional(number, 2)
      retention_unit   = optional(string, "COUNT")
    }), {})

    final_backup_config = optional(object({
      enabled        = optional(bool, true)
      retention_days = optional(number, 30)
    }), {})
  })
}
