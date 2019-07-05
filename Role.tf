provider "aws" {
  region  = "${var.region}"
  profile = "${var.account}"
}

resource "aws_iam_role" "okta_role" {
  # Define the name dynamically, run the loop based on count of the list 
  count = "${length(var.core)}"
  name  = "okta_${var.project}_${var.core[count.index]}"
  description="the role is specificaly for a team"

  # Trusted entity is saml integerated with OKTA so it is necessary to define them
  # Federated : your OKTA provider ARN 
  #used OKTA as a IDP provide 
  assume_role_policy = <<EOF
{
 
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::xxxxxxxxx:saml-provider/Okta_IDP"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

#   tags = {
#     role = "okta"
#   }


resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  
  role       = "okta_devops_dev" 
  count      = "${length(var.iam_policy_arn)}"
  policy_arn = "${var.iam_policy_arn[count.index]}"
  
}
resource "aws_iam_role_policy_attachment" "role-policy-attachment1" {

  role       = "okta_devops_qa"
  count      = "${length(var.iam_policy_arn1)}"
  policy_arn = "${var.iam_policy_arn1[count.index]}"
}
resource "aws_iam_role_policy_attachment" "role-policy-attachment2" {
  
  role       = "okta_devops_power_user" 
  
  count      = "${length(var.iam_policy_arn2)}"
  policy_arn = "${var.iam_policy_arn2[count.index]}"
  
}
