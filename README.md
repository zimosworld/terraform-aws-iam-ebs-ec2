Terraform module to provision AWS IAM Role/Profile for use with EBS EC2 instances.

## Module Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Name for the IAM role/profile | string | - | yes |
| tier | Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker') | string | WebServer | no |
| attach_full_s3_access | Add full S3 access permissions | string | true | no |

## Module Outputs

| Name | Description |
|------|-------------|
|id|The instance profile's ID.|
|arn|The ARN assigned by AWS to the instance profile.|
|create_date|The creation timestamp of the instance profile.|
|name|The instance profile's name.|
|path|The path of the instance profile in IAM.|
|role|The role assigned to the instance profile.|