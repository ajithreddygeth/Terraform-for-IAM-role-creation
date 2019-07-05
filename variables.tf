variable "region" {
  default = "us-west-2"
}

# cat ~/.aws/credentials 
# If you have multiple account change the name in default 
variable "account" {
  default = "default"
}



variable "project" {
  default = "devops"
}

variable "core" {
  type    = "list"
  default = ["dev", "qa", "power_user"]
}

variable "iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type        = "list"
  default     = ["arn:aws:iam::aws:policy/AWSLambdaFullAccess", "arn:aws:iam::aws:policy/AmazonGuardDutyFullAccess"]
}

variable "iam_policy_arn1" {
  description = "IAM Policy to be attached to role1"
  type        = "list"
  default     = ["arn:aws:iam::aws:policy/AWSConfigUserAccess","arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
variable "iam_policy_arn2" {
  description = "IAM Policy to be attached to role2"
  type        = "list"
  default     = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/AWSLambdaFullAccess"]
}

variable "environment" {
  default = "dev"
}



