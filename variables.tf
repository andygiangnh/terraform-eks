variable "networking" {
  type = object({
    cidr_block      = string
    vpc_name        = string
    azs             = list(string)
    public_subnets  = list(string)
    private_subnets = list(string)
    nat_gateways    = bool
  })
  default = {
    cidr_block      = "10.0.0.0/16"
    vpc_name        = "terraform-vpc"
    azs             = ["ap-southeast-1a", "ap-southeast-1b"]
    public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
    nat_gateways    = true
  }
}

variable "security_groups" {
  type = list(object({
    name        = string
    description = string
    ingress = object({
      description      = string
      protocol         = string
      from_port        = number
      to_port          = number
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
    })
  }))

  default = [{
    name        = "ssh"
    description = "Port 22"
    ingress = {
      description      = "Allow SSH access"
      protocol         = "tcp"
      from_port        = 22
      to_port          = 22
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
    }
  }]
}

variable "private_subnets_ids" {
  type    = list
  default = ["subnet-0e5f627c2109ec28b", "subnet-0b443601a542274fc"]
}

variable "security_groups_ids" {
  type    = list
  default = ["sg-013da2e4bf2a8043f"]
}