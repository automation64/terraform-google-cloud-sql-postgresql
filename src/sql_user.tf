resource "google_sql_user" "dba" {
  project = var.shared__project_id

  name            = local.google_sql_user.dba.name
  type            = local.google_sql_user.dba.type
  deletion_policy = local.google_sql_user.dba.deletion_policy
  database_roles  = local.google_sql_user.dba.database_roles

  instance            = google_sql_database_instance.main.name
  password_wo         = data.google_secret_manager_secret_version_access.dba.secret_data
  password_wo_version = data.google_secret_manager_secret_version_access.dba.version
}
