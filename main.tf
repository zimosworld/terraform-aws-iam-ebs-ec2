#--------------------------------------------------------------
# IAM EBS EC2 Role - Creates IAM Role for use with EBS EC2
#--------------------------------------------------------------

data "aws_iam_policy_document" "ec2" {
  statement {
    sid = ""

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    effect = "Allow"
  }

  statement {
    sid = ""

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ssm.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "ec2" {
  name               = "${var.name}-ec2"
  assume_role_policy = "${data.aws_iam_policy_document.ec2.json}"
}

resource "aws_iam_instance_profile" "ec2" {
  name = "${var.name}-ec2"
  role = "${aws_iam_role.ec2.name}"
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkMulticontainerDocker" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkWebTier" {
  count      = "${var.tier == "WebServer" ? 1 : 0}"
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "AWSElasticBeanstalkWorkerTier" {
  count      = "${var.tier == "Worker" ? 1 : 0}"
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_role_policy_attachment" "AmazonS3FullAccess" {
  count      = "${var.attach_full_s3_access == "true" ? 1 : 0}"
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ReadOnlyAccess" {
  role       = "${aws_iam_role.ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}