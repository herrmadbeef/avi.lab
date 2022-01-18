

# Security Rule Section 
resource "aws_security_group" "allow-HTTPs" {
  name        = "allow-HTTPs"
  description = "Allow HTTPS inbound"
  vpc_id = aws_vpc.vpc_cloud_network.id

  dynamic "ingress" {
    iterator = port 
    for_each  = var.IngressPorts 
    content {
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      #cidr_blocks      = ["0.0.0.0/0"] # to allow anyone on the internet 
      cidr_blocks      = ["69.246.90.90/32","192.168.208.0/20"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  }

  dynamic "egress" {
    iterator = port 
    for_each  = var.EgressPorts
    content {
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  }

  tags = {
    Name = "sg-cloud-network"
    owner        = "sanchep2" 
    project-name = "AVILab" 
    app-name     = "AVI" 
    app-function = "AVI PoC" 
    tier         = "1" 
    unique-id    = "1040" 
  }

}