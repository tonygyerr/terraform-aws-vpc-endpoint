variable "vpc_config" {
  description = "configuration option for vpc"
  type        = map(string)
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = ""
}

variable "create" {
  description = "Determines whether resources will be created"
  type        = bool
  default     = null
}

variable "public_subnet_ids" {
  description = "list of subnet ids"
  type        = list
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