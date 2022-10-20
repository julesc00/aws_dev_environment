resource "aws_key_pair" "dev_env_auth" {
  key_name = "dev-env-key"
  public_key = file(var.ec2_key)
}

resource "aws_instance" "dev_node" {
  instance_type = var.instance_type
  ami = data.aws_ami.dev_server_ami.id
  key_name = aws_key_pair.dev_env_auth.id
  vpc_security_group_ids = [aws_security_group.dev-sg.id]
  subnet_id = aws_subnet.dev_public_subnet.id
  user_data = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }

  tags = local.tags.instance
}
