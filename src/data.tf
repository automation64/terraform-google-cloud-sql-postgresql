#
# HashiCorp Random
#

resource "random_integer" "main" {
  min = 1
  max = 9999
}

#
# Google Secret Manager
#

data "google_secret_manager_secret_version_access" "dba" {
  secret = module.google_secret_manager_password__dba.google_secret_manager_secret.name
  depends_on = [
    module.google_secret_manager_password__dba
  ]
}
