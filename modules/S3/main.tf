resource "aws_s3_bucket" "apps_bucket" {
    bucket = "bucket-name"
    acl = "private"
    versioning {
            enabled = true
    }
    tags {
        Name = "bucket-name"
    }
}