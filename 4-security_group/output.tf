output "EC2_security_group" {
  value = aws_security_group.EC2.id
}

output "ALB_security_group" {
  value = aws_security_group.ALB.id
}


output "RDS_security_group" {
  value = aws_security_group.RDS.id
}
