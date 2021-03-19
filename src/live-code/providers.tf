terraform {
  required_providers {
    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }
  }
  backend "s3" {
    bucket = "mdbstate-terraform-backend"
    key    = "terraform/ec2_example/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}
provider "ansible" {}
