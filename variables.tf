variable "helm_defaults" {
  description = "Customize default Helm behavior"
  type        = any
  default     = {}
}

variable "release" {
  description = "Helm release"
  type        = any
  default     = {}
}
