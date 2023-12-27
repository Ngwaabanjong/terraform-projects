# Terraform Backend
- Why do we use backend?
- Terraform Backend is a configuration option in Terraform that allows you to store and manage the state of your infrastructure in a remote or local location.
- And the DynamoDB key is used to protect our remote state, which prevent 2 users from making changes at the same time.

## Types of Backend
- There are two types of Terraform backends: local and remote.
1. Local Backend: A local backend stores the state file on the machine where Terraform is running.
2. Remote Backend: A remote backend stores the state file in a centralized location, such as a cloud object storage service or a database. Remote backends provide several benefits, such as enabling collaboration between team members, versioning state files, and providing a history of changes.

## 1. Use code to create s3 and DynamoDB:
- Create s3 bucket.
- Don't create folders in the bucket.
- Backend configuration will uplaod the folders.

```tf
resource "aws_s3_bucket" "mys3" {
    name = "terraform-s3-bucket-001"
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}

# Create Dynamodb table
resource "aws_dynamodb_table" "mydynamodb" {
    name = "state-lock-001"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    read_capacity = 5
    write_capacity = 5
    attribute {
        name = "LockID"
        type = "S"
    }
  
}
```

## 2. Configure Backend:
- After creating s3 and DynamoDB table.
- Now configure provider and Backend.
```tf
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
}

terraform {
    backend "s3" {
        bucket = "terraform-s3-bucket-001"
        dynamodb_table = "state-lock-001"
        key    = "global/prj-01/terraform.tfstate"
        encrypt = true
        region = "us-east-1"
    }
}
```