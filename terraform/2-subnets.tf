resource "aws_subnet" "dev_public_subnet" {
  vpc_id                  = aws_vpc.dev_env_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = local.tags.subnets
}