variable ibmcloud_api_key {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  type        = string
  description = "The name of the IBM Cloud resource group where the Certificate Manager instance will be/has been provisioned."
}

variable "region" {
  description = "The region where the Certificate Manager will be/has been provisioned."
  default = "us-south"
  type        = string
}

variable "provision" {
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  type = bool
  default = true
}

variable "kms_enabled" {
  type        = bool
  description = "Flag indicating that kms encryption should be enabled for this instance"
  default     = false
}

variable "kms_id" {
  type        = string
  description = "The crn of the KMS instance that will be used to encrypt the instance."
  default     = null
}

variable "kms_public_url" {
  type        = string
  description = "The public url of the KMS instance that will be used to encrypt the instance."
  default     = null
}

variable "kms_private_url" {
  type        = string
  description = "The private url of the KMS instance that will be used to encrypt the instance."
  default     = null
}

variable "kms_private_endpoint" {
  type        = bool
  description = "Flag indicating the KMS private endpoint should be used"
  default     = true
}

variable "kms_key_crn" {
  type        = string
  description = "The crn of the root key in the KMS"
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "The name prefix for the Certificate Manager resource. If not provided will default to resource group name."
  default     = ""
}

variable "name" {
  description = "Name of the Certificate Manager. If not provided will be generated as $name_prefix-$label"
  type        = string
  default     = ""
}

variable "label" {
  description = "Label used to build the Certificate Manager name if not provided."
  type        = string
  default     = "cm_mvp"
}

variable "private_endpoint" {
  type        = bool
  description = "Flag indicating that the service should be access using private endpoints"
  default     = true
}
