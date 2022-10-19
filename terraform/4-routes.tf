resource "aws_route_table" "dev-public-rt" {
  vpc_id = aws_vpc.dev_env_vpc.id

  tags = local.tags.route-public
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.dev-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev-igw.id
}

/*
aws_route_table_association
Provides a resource to create an association between a route table and a subnet or a route
table and an Internet Gateway or Virtual Private Gateway.
*/
resource "aws_route_table_association" "dev_public_assoc" {
  route_table_id = aws_route_table.dev-public-rt.id
  subnet_id = aws_subnet.dev_public_subnet.id
}