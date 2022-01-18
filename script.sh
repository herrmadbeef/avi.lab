#!/bin/bash
sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html


############################################
## Install And Configure SSM Agent ##
############################################
 
## ------------
## Amazon Linux
## ------------
 
## Install AWS SSM Agent (Replace us-west-2 with the region where your ec2 instance is hosted)
sudo yum install -y https://s3.us-west-2.amazonaws.com/amazon-ssm-us-west-2/latest/linux_amd64/amazon-ssm-agent.rpm
 
## Start and enable SSM agent
sudo enable amazon-ssm-agent
sudo start amazon-ssm-agent
sudo status amazon-ssm-agent