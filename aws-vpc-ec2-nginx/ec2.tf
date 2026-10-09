#ec2 instance for nginx setup
resource "aws_instance" "nginxserver" {
    ami           = "ami-08e3b3155fc937a94" # Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = "t2.micro"  
    subnet_id     = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.nginx_sg.id]
    associate_public_ip_address = true


    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo amazon-linux-extras install nginx1 -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF


    tags = {
        Name = "nginxserver"
    }
}