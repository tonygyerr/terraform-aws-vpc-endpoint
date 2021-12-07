variable "vpc_config" {
  description = "configuration option for vpc"
  type        = map(string)
}

variable "endpoints" {
  description = "A map of interface and/or gateway endpoints containing their properties and configurations"
  type        = any
  default     = {}
}

variable "create" {
  description = "Determines whether resources will be created"
  type        = bool
  default     = null
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}

variable "subnet_ids" {
  description = "Default subnets IDs to associate with the VPC endpoints"
  type        = list(string)
  default     = []
}

variable "extra_tags" {
  type        = map(string)
  description = "optional default tags"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "optional default tags"
  default     = {}
}