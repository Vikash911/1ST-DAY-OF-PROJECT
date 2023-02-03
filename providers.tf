terraform {
	required_providers {
		aws = {
		source="registry.terraform.io/hashicorp/aws"
		version= "~> 4.10"
		}
	}

}
provider "aws" {
	region = "us-west-1"
	profile = "Vikash"
}
