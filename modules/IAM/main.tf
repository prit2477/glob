resource "aws_iam_role" "test_role" {
    name = "test_role"
    assume_role_policy = "${file("asumepolicy.json")}"
}
resource "aws_iam_instance_profile" "test_product_instance_profile" {
    name = "test_product_instance_profile"
    roles = ["${aws_iam_role.test_role.name}"]
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = "${aws_iam_role.test_role.id}"     // if this not added we can add extra block of attachment
  policy = "${file("s3writepolicy.json")}"
}


//resource "aws_iam_policy_attachment" "test-attach" {
//  name       = "test-attachment"
//  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
//  policy_arn = "${aws_iam_policy.policy.arn}"
//}