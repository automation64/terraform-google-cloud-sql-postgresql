#
# Shared
#

output "shared__labels" {
  description = "Module wide labels"
  value       = local.shared__labels
}

#
# Google SQL Database Instance
#

output "google_sql_database_instance" {
  value = {
    available_maintenance_versions = google_sql_database_instance.main.available_maintenance_versions
    connection_name                = google_sql_database_instance.main.connection_name
    database_version               = google_sql_database_instance.main.database_version
    deletion_protection            = google_sql_database_instance.main.deletion_protection
    dns_name                       = google_sql_database_instance.main.dns_name
    dns_names                      = google_sql_database_instance.main.dns_names
    encryption_key_name            = google_sql_database_instance.main.encryption_key_name
    first_ip_address               = google_sql_database_instance.main.first_ip_address
    id                             = google_sql_database_instance.main.id
    instance_type                  = google_sql_database_instance.main.instance_type
    ip_address                     = google_sql_database_instance.main.ip_address
    maintenance_version            = google_sql_database_instance.main.maintenance_version
    master_instance_name           = google_sql_database_instance.main.master_instance_name
    name                           = google_sql_database_instance.main.name
    node_count                     = google_sql_database_instance.main.node_count
    private_ip_address             = google_sql_database_instance.main.private_ip_address
    project                        = google_sql_database_instance.main.project
    psc_service_attachment_link    = google_sql_database_instance.main.psc_service_attachment_link
    public_ip_address              = google_sql_database_instance.main.public_ip_address
    region                         = google_sql_database_instance.main.region
    replica_names                  = google_sql_database_instance.main.replica_names
    self_link                      = google_sql_database_instance.main.self_link
    service_account_email_address  = google_sql_database_instance.main.service_account_email_address
    replica_configuration          = google_sql_database_instance.main.replica_configuration
    replication_cluster            = google_sql_database_instance.main.replication_cluster
    settings                       = google_sql_database_instance.main.settings
  }
  description = "GCP SQL Database Instance"
  sensitive   = false
}

#
# Google SQL User
#

output "google_sql_user" {
  value = {
    dba = {
      database_roles  = google_sql_user.dba.database_roles
      deletion_policy = google_sql_user.dba.deletion_policy
      instance        = google_sql_user.dba.instance
      name            = google_sql_user.dba.name
      type            = google_sql_user.dba.type
    }
  }
  description = "Google SQL Users"
  sensitive   = false
}
