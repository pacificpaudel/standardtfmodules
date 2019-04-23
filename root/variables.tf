#variables used in root

variable "aws_region" {
    description = "AWS region to launch servers."
    default = "eu-west-1"
}

variable "aws_amis" {
    default = {
        "eu-west-1" = "ami-08660f1c6fb6b01e7"
    }
}

variable "key_name" {
default="testsite"

}

variable "public_key_path" {
    default="./testsite.pub"
    
}