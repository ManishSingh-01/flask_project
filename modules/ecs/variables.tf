variable "vpc_id" { type = string }
variable "subnets" { type = list(string) }
variable "security_group_id" { type = string }
variable "execution_role_arn" { type = string }
variable "repo_url" { type = string }
