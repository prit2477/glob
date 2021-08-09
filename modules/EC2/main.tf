resource "aws_instance" "my_instance" {
	ami = var.ami
	instance_type = var.instance_type
    key_name = var.key_name
	iam_instance_profile = "${aws_iam_instance_profile.test_product_instance_profile.name}"

	tags = {
		Name = test_product	
	}
}
