terraform{
    backend "s3"{
        # Replace this with your bucket name!
        bucket         = "terraform-up-and-running-state"
        key            = "global/s3/terraform.tfstate"
        region         = "us-east-2"

        # Replace this with your DynamoDB table name!
        #dynamodb_table = "terraform-up-and-running-locks"
        #encrypt        = true
  
    }
}

provider "aws" {
    region="eu-west-2"
}

resource "aws_s3_bucket" "terraform_state"{
    bucket= "terraform-up-and-running-state"
    # Prevent accidental deletion of this bucket
    lifecycle{
        prevent_destroy=true
    }
    #Enable versioning so we can see the full revision history
    versioning{
        enabled=true
    }
      # Enable server-side encryption by default
    server_side_encryption_configuration {
        rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
        }
  }
}
/*
  # If we need to lock terraform state file we have to use DynamoDB
  resource "aws_dynamodb_table" "terraform_locks" {
    name         = "terraform-up-and-running-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
    }
*/
