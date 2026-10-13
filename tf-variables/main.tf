
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = var.root_block_device.delete_on_termination
    volume_size           = var.root_block_device.volume_size
    volume_type           = var.root_block_device.volume_type
  }

  tags = merge(var.additional_tags, {
    Name = "ExampleInstance"
  })
}
