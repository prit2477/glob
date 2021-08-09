resource "aws_s3_bucket" "test_bucket" {
    bucket = "${var.s3_bucket_name}" 
    acl = "${var.acl}"   
}

    tags {
        Name = "test_product"
}

