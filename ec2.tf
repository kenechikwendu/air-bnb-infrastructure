resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  monitoring = true
  tags = {
    Name = var.tags
  }
}

