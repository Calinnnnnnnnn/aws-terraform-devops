terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "my_ip_cidr" {
  type        = string
  description = "My IP for SSH connection - format /32"
}

variable "public_key_path" {
  type        = string
  description = "Path to public key for SSH connection"
  default     = "/keys"
}



