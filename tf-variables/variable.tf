variable "instance_type" {
  description = "what type of instance you want to create"
  type        = string
  validation {
    condition = var.instance_type in ["t2.micro", "t2.small", "t2.medium", "t3.micro", "t3.small", "t3.medium"]
    error_message = "Invalid instance type. Allowed values are: t2.micro, t2.small, t2.medium, t3.micro, t3.small, t3.medium."
  }
  
}
variable "root_block_device" {
  description = "Root block device configuration"
  type = object({
    delete_on_termination = bool
    volume_size           = number
    volume_type           = string
  })
  default = {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }
}

variable "additional_tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}