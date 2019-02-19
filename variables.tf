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