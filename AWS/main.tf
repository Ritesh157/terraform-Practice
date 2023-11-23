terraform {
	required_providers {
		aws = {
		source  = "hashicorp/aws"
		version = "~> 5.0"
}
}
	required_version = ">= 1.2.0"
}

provider "aws" {
        region = "ap-south-1"
}

locals {
	instances = {"devendra":"ami-02a2af70a66af6dfb","Braj":"ami-0287a05f0ef0e9d9a","Abrar":"ami-0287a05f0ef0e9d9a","Nimo":"ami-02a2af70a66af6dfb"}
}

resource "aws_instance" "my_ec2_test" {
	for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
                Name = each.key
}
}
