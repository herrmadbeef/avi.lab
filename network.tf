############
#terraform version >= 12
############


terraform {
  required_version = ">= 0.12"
}



#locals {
#  name   = "cloud-network"
#  region = "us-west-2"
#  tags = {
#    owner       = "user"
#    Environment = "staging"
#    Name        = "complete"
#  }
#}



################################################################################
# VPC
################################################################################

resource "aws_vpc" "vpc_cloud_network" {
  cidr_block           = var.cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_classiclink   = var.enable_classiclink

  tags = {
    Name         = "vpc-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }

}

################################################################################
# Internet Gateway 
################################################################################

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_cloud_network.id

  tags = {
    Name         = "igw-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}


################################################################################
# NAT Gateway 
################################################################################


resource "aws_eip" "nat" {
  vpc = true

    tags = {
    Name         = "eip-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id
  depends_on    = [aws_internet_gateway.gw]

    tags = {
    Name         = "natgw-cloud-network-"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}



#########
# we are only setting up one private subnet 
#########


#resource "aws_route_table_association" "private_2" {
#  subnet_id      = "${aws_subnet.private_2.id}"
#  route_table_id = "${aws_route_table.route_private.id}"
#}
#resource "aws_route_table_association" "private_3" {
#  subnet_id      = "${aws_subnet.private_3.id}"
#  route_table_id = "${aws_route_table.route_private.id}"
#}




################################################################################
# Route Table 
################################################################################


#######
# PUBLIC rtb
#######

#creating the route table 
resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.vpc_cloud_network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name         = "pub-rtb-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}




#######
# PRIVATE rtb
#######

resource "aws_route_table" "route_private" {
  vpc_id = aws_vpc.vpc_cloud_network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name         = "prv-rtb-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}






################################################################################
# Private Subnets 
################################################################################


resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.vpc_cloud_network.id
  map_public_ip_on_launch = false
  cidr_block              = "192.168.208.96/27"

  tags = {
    Name         = "private_1-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}

# Associating the PRIVATE rtb to public subnets 

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.route_private.id
}

#########
# we are only setting up one private subnet 
#########

#resource "aws_subnet" "private_2" {
#  vpc_id     = aws_vpc.vpc_cloud_network.id
#  map_public_ip_on_launch = false
#  cidr_block = "10.0.5.0/24"
#
#  tags = {
#    Name = "private_2-demo"
#  }
#}
#resource "aws_subnet" "private_3" {
#  vpc_id     = aws_vpc.vpc_cloud_network.id
#  map_public_ip_on_launch = false
#  cidr_block = "10.0.6.0/24"
#
#  tags = {
#    Name = "private_3-demo"
#  }
#}



################################################################################
# Public Subnets 
################################################################################



resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.vpc_cloud_network.id
  map_public_ip_on_launch = true
  cidr_block              = "192.168.208.0/27"
  availability_zone = "us-west-2a"

  tags = {
    Name         = "public_1-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.vpc_cloud_network.id
  map_public_ip_on_launch = true
  cidr_block              = "192.168.208.32/27"
  availability_zone = "us-west-2b"

  tags = {
    Name         = "public_2-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}
resource "aws_subnet" "public_3" {
  vpc_id                  = aws_vpc.vpc_cloud_network.id
  map_public_ip_on_launch = true
  cidr_block              = "192.168.208.64/27"
  availability_zone = "us-west-2c"

  tags = {
    Name         = "public_3-cloud-network"
    owner        = "sanchep2"
    project-name = "AVILab"
    app-name     = "AVI"
    app-function = "AVI PoC"
    tier         = "1"
    unique-id    = "1040"
  }
}


# Associating the PUBLIC rtb to public subnets 



resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.route-public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.route-public.id
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.route-public.id
}




