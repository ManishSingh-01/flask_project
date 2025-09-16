output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "sg_id" {
  value = aws_security_group.ecs_sg.id
}
