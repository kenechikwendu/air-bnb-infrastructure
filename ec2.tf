resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = "ansible-dynamic-inventory-role"
  monitoring = true
  ebs_optimized = true
  root_block_device {
    encrypted = true
  }
  tags = {
    Name = var.tags
  }
}

