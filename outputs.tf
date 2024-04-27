output backend_s3_bucket {
value = aws_s3_bucket.tfstate-bucket.id
sensitive = false
description = "Backend S3 bucket"
}

output s3_backend_lock_table {
value = aws_dynamodb_table.terraform_state_lock.name
sensitive = false
description = "DynamoDB Lock table name"
}