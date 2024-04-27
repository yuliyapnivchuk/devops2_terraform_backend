provider "aws" {
  region                   = "us-east-1"
  profile                  = "default"
  shared_credentials_files = ["~/.aws/credentials"]
}

# Define S3 back-end bucket
resource "aws_s3_bucket" "tfstate-bucket" {
  bucket = "labs-state-bucket"

}
# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "tfstate-bucket-versioning" {
  bucket = aws_s3_bucket.tfstate-bucket.id  # Reference the ID of the S3 bucket
  versioning_configuration {
    status = "Disabled"
  }
}

# Define the DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}


