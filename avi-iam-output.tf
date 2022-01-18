output "output-AviController-Refined-Role" {
  value = aws_iam_role.AviController-Refined-Role.name
}


#####
# need the ARS of the policies created to be used on the role
#####
# Template 
/*

output "output-name" {
  value = aws_iam_policy.name.arn
}

*/

output "output-avi-vmimport-policy" {
  value = aws_iam_policy.avi-vmimport-policy.arn
}



output "output-avi-kmsimport-policy" {
  value = aws_iam_policy.avi-kmsimport-policy.arn
}





output "output-avicontroller-ec2-policy-arn" {
  value = aws_iam_policy.avicontroller-ec2-policy.arn
}

output "output-AviController-IAM-Policy" {
  value = aws_iam_policy.AviController-IAM-Policy.arn
}

output "output-AviController-s3-Policy" {
  value = aws_iam_policy.AviController-s3-Policy.arn
}

output "output-AviController-R53-Policy" {
  value = aws_iam_policy.AviController-R53-Policy.arn
}

output "output-AviController-AutoScalingGroup-Policy" {
  value = aws_iam_policy.AviController-AutoScalingGroup-Policy.arn
}

output "output-AviController-SQS-SNS-Policy" {
  value = aws_iam_policy.AviController-SQS-SNS-Policy.arn
}

output "output-AviController-KMS-Policy" {
  value = aws_iam_policy. AviController-KMS-Policy.arn
}
