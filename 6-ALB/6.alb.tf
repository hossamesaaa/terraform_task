resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ALB_security_group]
  subnets            = [var.aws_subnet_public_1, var.aws_subnet_public_2]

   tags = {
    Name = "${var.name_tag}-${var.environment}-lb"
  }
}

#################target_group###############
resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_vpc_id
  target_type = "instance"
}


##################target_group########################
resource "aws_lb_target_group_attachment" "instance1" {
target_group_arn = aws_lb_target_group.test.arn
target_id        = var.aws_instance_web1
  port             = 80
}

resource "aws_lb_target_group_attachment" "instance2" {
 target_group_arn = aws_lb_target_group.test.arn
 target_id        = var.aws_instance_web2
  port             = 80
}




#########################listener###########################3
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}