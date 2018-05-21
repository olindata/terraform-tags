# Terraform module input variables
variable "name" {
  description = "Solution name, e.g. 'app' or 'web' or 'db', include the number if more than one, eg: web1"
  default      = ""
}

variable "stage" {
  description = "Stage, e.g. 'prod', 'stg', 'dev', 'beta', 'test'"
}

variable "client" {
  description = "Client name 3-letter abbreviation"
  default     = ""
}

variable "stack_name" {
  description = "The name of the stack, which should be hardcoded into every stack.  Eg: vpc, mvp-ec2"
  default     = ""
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between strings, typically is -, optionally set to empty string for windows hostnames and such"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags to tack onto this object (e.g. `map('Purpose`,`webserver`)"
}
