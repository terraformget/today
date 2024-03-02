provider "aws" {
region = "ap-southeast-1"
}

# variables.tf
variable "ami" {
  type    = string
  default = "ami-07a6e3b1c102cdba8"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" {
  type    = list(string)
  default = ["testt","prodt"]
}
variable "subnet_id" {
   type = string
   default = "subnet-0b3e79883d050da5e" 
}

# main.tf
resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  for_each      = toset(var.sandboxes)
  tags = {
    Name = each.value 
}

}
