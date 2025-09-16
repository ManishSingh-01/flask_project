output "ecs_cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "ecs_service_name" {
  value = aws_ecs_service.app_service.name
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}
