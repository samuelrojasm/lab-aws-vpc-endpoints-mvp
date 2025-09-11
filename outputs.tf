# outputs.tf

output "vpce_sg_id" {
  description = "Security Group ID usado por los VPC Endpoints"
  value       = aws_security_group.vpc_endpoints_sg.id
}

output "s3_vpce_id" {
  description = "VPC Endpoint ID para S3"
  value       = module.vpc_endpoints.endpoints.s3.id
}

output "ssm_vpce_id" {
  description = "VPC Endpoint ID para SSM"
  value       = module.vpc_endpoints.endpoints.ssm.id
}

output "vpce_ids" {
  description = "IDs de todos los VPC Endpoints"
  value = {
    eks         = module.vpc_endpoints.endpoints.eks.id
    eks_auth    = module.vpc_endpoints.endpoints.eks_auth.id
    ec2         = module.vpc_endpoints.endpoints.ec2.id
    ec2messages = module.vpc_endpoints.endpoints.ec2messages.id
    s3          = module.vpc_endpoints.endpoints.s3.id
    ssm         = module.vpc_endpoints.endpoints.ssm.id
    ssmmessages = module.vpc_endpoints.endpoints.ssmmessages.id
    kms         = module.vpc_endpoints.endpoints.kms.id
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

