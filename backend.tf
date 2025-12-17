terraform {
  backend "s3" {
    bucket  = "2025-backend-state"
    key     = "envs/dev/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

