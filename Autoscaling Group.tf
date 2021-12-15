resource "aws_launch_configuration" "Proj6_ASG" {
  name_prefix   = "Proj6_ASG"
  image_id      = "ami-04dd4500af104442f"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
  
}