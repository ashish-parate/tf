output "aws_instance_public-ip" {
  value = aws_instance.myserver.public_ip
}