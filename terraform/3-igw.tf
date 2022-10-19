resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev_env_vpc.id

  tags = local.tags.igw
}