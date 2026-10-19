terraform {
    backend "s3" {
        bucket = "dev-kavindu-bucket"
        region = "us-east-1"
        key = "./jenkins-server.tf/terraform.tfstate"
        encrypt = true
        use_lockfile = true
    }

    required_version = ">=1.13.3"

    required_providers {
        aws = {
            version = ">=5.49.0"
            source = "hashicorp/aws"
        }
    }
}