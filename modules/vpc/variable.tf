variable "aws_region" {
	default = "us-east-1"
}

variable "vpc_cidr" {
	type = string 
    default = "10.0.0.0/16"
}

variable "public_subnets_1" {
	type = string
	default = "10.0.0.128/26"
}

variable "private_subnets_2" {
	type = string
	default = "10.0.0.192/26"
}


variable "azs" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}