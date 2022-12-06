terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.15.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = "~> 3.4.0"
    }
  }

  required_version = "~> 1.3"
}