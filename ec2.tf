resource "aws_instance" "vm" {
  ami                    = data.aws_ami.amazon-linux.id
  instance_type          = var.instance_type
  tags = {
    Name = "DEMO VM DESTROY ME - ${terraform.workspace}",
    Terraform = "true"
  }
}

data "aws_ami" "amazon-linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

}
