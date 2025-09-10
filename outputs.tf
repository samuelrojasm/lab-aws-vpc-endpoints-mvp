# outputs.tf

output "vpce_sg_id" {
  description = "Security Group ID usado por los VPC Endpoints"
  value       = aws_security_group.vpc_endpoints_sg.id
}

output "s3_vpce_id" {
  description = "VPC Endpoint ID para S3"
  value       = aws_vpc_endpoint.s3.id
}

output "ssm_vpce_id" {
  description = "VPC Endpoint ID para SSM"
  value       = aws_vpc_endpoint.ssm.id
}

output "vpce_ids" {
  description = "IDs de todos los VPC Endpoints"
  value = {
    s3  = aws_vpc_endpoint.s3.id
    ssm = aws_vpc_endpoint.ssm.id
  }
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = var.private_subnets_cidrs
}

output "vpc_id" {
  description = "ID de la VPC"
  value       = module.vpc.vpc_id
}

