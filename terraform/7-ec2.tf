resource "aws_key_pair" "dev_env_auth" {
  key_name = "dev-env-key"
  public_key = file(var.ec2_key)
}