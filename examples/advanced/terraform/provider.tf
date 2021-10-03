terraform {
  backend "s3" {}
  required_version = ">= 0.13.6"

  required_providers {
    aws = "~> 3.51.0"
  }
}

provider "aws" {
  region = var.primary_region
}

provider "aws" {
  alias  = "primary"
  region = var.primary_region
}

provider "aws" {
  alias  = "secondary1"
  region = var.secondary1_region
}

provider "aws" {
  alias  = "secondary2"
  region = var.secondary2_region
}
