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
    X_RESOURCE_X = coalesce(var.shared__prefix.X_RESOURCE_X, module.lib_catalog.X_PROVIDER_ID_X.X_RESOURCE_ID_X)
  }

  #
  # X_RESOURCE_TITLE_X
  #

  # example # X_RESOURCE_X = {
  # example #   name = "${local.shared__prefix.X_RESOURCE_X}-${var.shared__name}"
  # example #   labels = merge(
  # example #     local.shared__labels,
  # example #     var.shared__labels
  # example #   )
  # example # }
}
