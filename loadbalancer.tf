# Create Application Load Balancer

resource "aws_lb" "proj-lb" {
  name               ="project-6-load-balancer"
  internal           = false
  load_balancer_type = "application"

  subnets   = [
    aws_subnet.Public-Subnet-1.id , 
    aws_subnet.Public-Subnet-2.id]
  
security_groups = [aws_security_group.Project-6-Security-Group.id]

  enable_deletion_protection = false

  tags = {
    Name = "proj-lb"
  }
}
# Create Target Group
# Terraform aws create target group

resource "aws_lb_target_group" "project-TG" {
  name     = "tar-load-balancer"
  target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Project6-VPC.id
}

# Create a listener on port 80

   resource "aws_lb_listener" "proj_listener_group" {
  load_balancer_arn = aws_lb.proj-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
target_group_arn = aws_lb_target_group.project-TG.arn
  }
}