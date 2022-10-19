resource "aws_security_group" "dev-sg" {
  name        = "dev_sg"
  description = "Dev environment security group."
  vpc_id      = aws_vpc.dev_env_vpc.id

  ingress {
    description      = "All all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  # Allow all
    cidr_blocks      = ["187.205.77.81/32"]  # The '32' means to only use such ip v4 address or 0.0.0.0/0 for all access
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "dev_sg"
  }
}