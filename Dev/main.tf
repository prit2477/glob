provider "aws" {
  region     = "us-east-1"
  
}

module "EC2" {
  source = "modules/EC2"

  
}
module "S3" {
  source = "modules/S3"
}



l