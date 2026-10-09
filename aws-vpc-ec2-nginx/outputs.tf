#output public ip of ec2 instance and url to access nginx server
output "nginxserver_public_ip" {
    description = "Public IP of the nginx server"
    value       = aws_instance.nginxserver.public_ip
}

output "nginxserver_url" {
    description = "URL to access the nginx server"
    value       = "http://${aws_instance.nginxserver.public_ip}"
}