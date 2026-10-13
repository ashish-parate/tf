
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string

  validation {
    condition = contains(
      ["t2.micro", "t2.small", "t2.medium"],
      var.instance_type
    )
    error_message = "Allowed values are t2.micro, t2.small, and t2.medium."
  }
}

variable "root_block_device" {
  description = "Root EBS volume configuration"
  type = object({
    delete_on_termination = bool
    volume_size           = number
    volume_type           = string
  })

  default = {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp3"
  }
}

variable "additional_tags" {
  description = "Additional tags for the EC2 instance"
  type        = map(string)

  default = {
    Environment = "Dev"
    Project     = "Terraform"
  }
}
