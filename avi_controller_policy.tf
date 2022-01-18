
# All this policies cam from the Guide https://avinetworks.com/docs/21.1/iam-role-setup-for-installation-into-aws/ 


# please use this to copy and create new policies 
/*

####
# name-policy
####

resource "aws_iam_policy" "name-policy" {
  name = "name-policy"
  path = "/"
  description = "description"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.

  # policy = file("filename.json")

  policy = jsonencode()

  tags = {
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }

}

*/

####
# avi-vmimport-policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/vmimport-role-policy.json
####


resource "aws_iam_policy" "avi-vmimport-policy" {
  name = "avi-vmimport-policy"
  path = "/"
  description = "Enables the Avi SE VM to be imported into AWS. Without this IAM role, the Avi SE cannot be launched. This role is associated with the AWS account (not with the Avi Controller)."

  
  policy = file("vmimport-role-policy.json")

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
# avi-kmsimport-policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-kms-vmimport.json
####

resource "aws_iam_policy" "avi-kmsimport-policy" {
  name = "avi-kmsimport-policy"
  path = "/"
  description = "Used to create an IAM policy and attached to vmimport role, or it can be directly applied to the KMS key."
  
  policy = file("avicontroller-kms-vmimport.json")

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
# avicontroller-ec2-policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-ec2-policy.json/
####

resource "aws_iam_policy" "avicontroller-ec2-policy" {
  name = "avicontroller-ec2-policy"
  path = "/"
  description = "Enables Avi Controller instance to be installed."

  policy = file("avicontroller-ec2-policy.json")

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
# AviController-IAM-Policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-iam-policy.json/
####

resource "aws_iam_policy" "AviController-IAM-Policy" {
  name = "AviController-IAM-Policy"
  path = "/"
  description = "Enable access to retrieve IAM roles and policy information."

  policy = file("avicontroller-iam-policy.json")

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
# AviController-s3-Policy
####

resource "aws_iam_policy" "AviController-s3-Policy" {
  name = "AviController-s3-Policy"
  path = "/"
  description = "Enables S3 permissions."

  policy = file("avicontroller-s3-policy.json")

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
# AviController-R53-Policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-r53-policy.json/
####


resource "aws_iam_policy" "AviController-R53-Policy" {
  name = "AviController-R53-Policy"
  path = "/"
  description = "Enables access to the AWS cloud's DNS."

  policy = file("avicontroller-r53-policy.json")

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
# AviController-AutoScalingGroup-Policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-asg-policy.json
####

resource "aws_iam_policy" "AviController-AutoScalingGroup-Policy" {
  name = "AviController-AutoScalingGroup-Policy"
  path = "/"
  description = "Enables read access to the AWS cloud's Auto Scaling groups."

  policy = file("avicontroller-asg-policy.json")

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
# AviController-SQS-SNS-Policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-sqs-sns-policy.json
####

resource "aws_iam_policy" "AviController-SQS-SNS-Policy" {
  name = "AviController-SQS-SNS-Policy"
  path = "/"
  description = "Enables Avi Controller to use SNS and SQS feature for Auto Scaling groups. .Allows NSX ALB Controller to receive ASG notifications when SNS and SQS features are enabled."

  policy = file("avicontroller-sqs-sns-policy.json")

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
# AviController-KMS-Policy
# https://github.com/avinetworks/devops/blob/master/aws/iam-policies/avicontroller-kms-policy.json
####

resource "aws_iam_policy" "AviController-KMS-Policy" {
  name = "AviController-KMS-Policy"
  path = "/"
  description = "Enables the Avi Controller to list the encryption keys in the Avi UI, and decrypt encrypted messages (required, when using SQS encryption)"

  policy = file("avicontroller-kms-policy.json")

  tags = {
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }

}