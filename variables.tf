variable "bk_count" {
  type        = number
  description = "The number of buckets you want to create."
  default     = 2
}

variable "name" {
  type    = string
  default = "programmable-demo"
}

variable "project" {
  type    = string
  default = "programmable-demo-2025"
}

variable "region" {
  type    = string
  default = "australia-southeast2"
  validation {
    condition     = can(regex("^(australia-southeast1|australia-southeast2)$", var.region))
    error_message = "Invalid region selected, only allowed regions are: `australia-southeast1`, `australia-southeast2`"
  }
}

variable "zone" {
  type    = string
  default = "australia-southeast2-b"
}
