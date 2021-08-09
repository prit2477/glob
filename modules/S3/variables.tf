variable "aws_region" {
  description = "The AWS region to use to create resources."
  default     = "us-east-2"
}

variable "bucket_prefix" {
    type        = string
    description = "(required since we are not using 'bucket') Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
    default     = "my-s3bucket-"
}

variable "s3_bucket_name" {
   type = "list"
   default = "test_bucket_glob"
}


variable "tags" {
    type        = map
    description = "(Optional) A mapping of tags to assign to the bucket."
    default     = {
        Name = "test_product"
        terraform   = "true"
    }
}

variable "acl" {
    type        = string
    description = " Defaults to private "
    default     = "private"
}

