

# Create WEB Server  EC2 instnace 
resource "aws_instance" "WebServer" {
  ami             = data.aws_ssm_parameter.ec2-ami.value
  instance_type   = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-HTTPs.id]
  subnet_id              = aws_subnet.private_1.id



  # this is to run the script 
  user_data = fileexists("server-script.sh") ? file("server-script.sh") : null

  tags = {
    Name         = "Web-Server"
    owner        = "sanchep2" 
    project-name = "AVILab" 
    app-name     = "AVI" 
    app-function = "AVI PoC" 
    tier         = "1" 
    unique-id    = "1040" 
  }

}
