output "vpc_id" {
  value = "aws_vpc.vpc_cloud_network.id"
}


# Additional information 

output "aws_aws_nat_gateway_eip" {
  value = "aws_eip.nat.id"
}

output "aws_route_table_private" {
  value = "aws_route_table.route_private.id"
}

output "aws_route_table_public" {
  value = "aws_route_table.route-public.id"
}

output "Internet_gw_id" {
  value = "aws_internet_gateway.gw.id"
}


