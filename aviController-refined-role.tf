

####
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-role-trust.json
####

resource "aws_iam_role" "AviController-Refined-Role" {
  name = "AviController-Refined-Role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  
  assume_role_policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
})

  tags = {
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }

}


####
# attaching the policies to "AviController-Refined-Role"
####
# Template 
/*
resource "aws_iam_role_policy_attachment" "policy-attach-name" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.name.arn
}
*/



resource "aws_iam_role_policy_attachment" "policy-attach-avicontroller-ec2-policy" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.avicontroller-ec2-policy.arn
}


resource "aws_iam_role_policy_attachment" "policy-attach-AviController-IAM-Policy" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.AviController-IAM-Policy.arn
}


resource "aws_iam_role_policy_attachment" "policy-attach-AviController-s3-Policy" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.AviController-s3-Policy.arn
}


resource "aws_iam_role_policy_attachment" "policy-attach-AviController-R53-Policy" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.AviController-R53-Policy.arn
}


resource "aws_iam_role_policy_attachment" "policy-attach-AviController-AutoScalingGroup-Policy" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.AviController-AutoScalingGroup-Policy.arn
}

resource "aws_iam_role_policy_attachment" "policy-attach-AviController-SQS-SNS-Policy" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.AviController-SQS-SNS-Policy.arn
}

resource "aws_iam_role_policy_attachment" "policy-attach-AviController-KMS-Policy" {
  role = "AviController-Refined-Role"
  policy_arn = aws_iam_policy.AviController-KMS-Policy.arn
}


####
# attaching the newly created policies avi-vmimport-policy and avi-kmsimport-policy to vmimport (already exist)
####





resource "aws_iam_role_policy_attachment" "policy-attach-avi-vmimport-policy" {
  role = "vmimport"
  policy_arn = aws_iam_policy.avi-vmimport-policy.arn
}


resource "aws_iam_role_policy_attachment" "policy-attach-avi-kmsimport-policy" {
  role = "vmimport"
  policy_arn = aws_iam_policy.avi-kmsimport-policy.arn
}

# NOTE: This  other syntax will work too using the data source 

#data "aws_iam_role" "aws-managed-vmimport" {
#  name = "vmimport"
#}
#
#
#resource "aws_iam_role_policy_attachment" "policy-attach-avi-kmsimport-policy" {
#  role = data.aws_iam_role.aws-managed-vmimport.name
#  policy_arn = aws_iam_policy.avi-kmsimport-policy.arn
#}
