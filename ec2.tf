resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = "test"

  tags = {
    Name = var.tags
  }
}

