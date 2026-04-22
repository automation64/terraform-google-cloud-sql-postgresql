module "lib_catalog" {
  source  = "registry.terraform.io/automation64/catalog/lib"
  version = "v1.3.0"
}

module "google_secret_manager_password__dba" {
  source  = "registry.terraform.io/automation64/secret-manager-password/google"
  version = "v1.0.0"

  shared__location   = var.shared__location
  shared__project_id = var.shared__project_id

  shared__name = local.google_secret_manager_password.dba.name
  google_secret_manager_secret = {
    deletion_protection = var.shared__allow_delete
  }
}
