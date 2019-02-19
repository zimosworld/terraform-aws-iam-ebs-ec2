#--------------------------------------------------------------
# IAM EBS EC2 Role Output
#--------------------------------------------------------------

output "id" {
  description = "The instance profile's ID."
  value       = "${aws_iam_instance_profile.ec2.id}"
}

output "arn" {
  description = "The ARN assigned by AWS to the instance profile."
  value       = "${aws_iam_instance_profile.ec2.arn}"
}

output "create_date" {
  description = "The creation timestamp of the instance profile."
  value       = "${aws_iam_instance_profile.ec2.create_date}"
}

output "name" {
  description = "The instance profile's name."
  value       = "${aws_iam_instance_profile.ec2.name}"
}

output "path" {
  description = "The path of the instance profile in IAM."
  value       = "${aws_iam_instance_profile.ec2.path}"
}

output "role" {
  description = "The role assigned to the instance profile."
  value       = "${aws_iam_instance_profile.ec2.role}"
}