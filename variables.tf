#--------------------------------------------------------------
# IAM EBS EC2 Role Variables
#--------------------------------------------------------------

variable "name" {
  description = "IAM name"
}

variable "tier" {
  description = "Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker')"
  default = "WebServer"
}

variable "attach_full_s3_access" {
  description = "Add full S3 access permissions"
  default = "true"
}