# Import resources using Terraform 

## Sample template for ec2
- create main.tf file and insert below code.
```
# Configure the provider 
provider "aws" {
  region = "us-east-1"
}

# Configure resource block with no attributes. 
resource "aws_instance" "example_server" {

}
```

## CMD to IMPORT:
- Resource block name defined on main.tf and existing instance ID.
```
terraform import aws_instance.<resource_block_name> <instance_id>
terraform import aws_instance.example_server i-01ea04363e9cdd676
```
## After import 
- To see imported block and now copy it and modify the exsisting block.
```
terraform show 
```


