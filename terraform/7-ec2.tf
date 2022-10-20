resource "aws_key_pair" "dev_env_auth" {
  key_name   = "dev-env-key"
  public_key = file(var.ec2_key)
}

resource "aws_instance" "dev_node" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.dev_server_ami.id
  key_name               = aws_key_pair.dev_env_auth.id
  vpc_security_group_ids = [aws_security_group.dev-sg.id]
  subnet_id              = aws_subnet.dev_public_subnet.id
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }

  /*
  This section is to dynamically add the ec2 public ip and key to my local ssh config file and be
  able to automatically ssh into the instance, let's say by using ssh remote development from th IDE.

  Terraform plan or apply will not detect this section if added once the ec2 instance has been provisioned,
  so it can be ran: terraform apply -var-file dev.tfvars -replace aws_instance.dev_node
  This is exclusively for this project since I use different tfvars files.
  */
  provisioner "local-exec" {
    command = templatefile("${var.host_os}-config.tpl", {
      hostname = self.public_ip,
      user = "ubuntu",
      identityfile = var.ec2_key
    })
    interpreter = ["bash", "-c"]
  }

  tags = local.tags.instance
}
