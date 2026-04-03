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
  type        = object({})
  default     = {}
}

variable "shared__labels" {
  description = "Common labels to be applied to all resources"
  sensitive   = false
  nullable    = true
  type        = map(string)
  default     = {}
}

#
# X_RESOURCE_TITLE_X
#
