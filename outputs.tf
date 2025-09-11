# outputs.tf

output "vpce_sg_id" {
  description = "Security Group ID usado por los VPC Endpoints"
  value       = aws_security_group.vpc_endpoints_sg.id
}

output "eks_vpce_id" {
  description = "VPC Endpoint ID para eks"
  value       = module.vpc_endpoints.endpoints.s3.id
}

output "eks_auth_vpce_id" {
  description = "VPC Endpoint ID para eks-auth"
  value       = module.vpc_endpoints.endpoints.ssm.id
}

output "vpce_ids" {
  description = "IDs de todos los VPC Endpoints"
  value = {
    eks         = module.vpc_endpoints.endpoints.eks.id
    eks_auth    = module.vpc_endpoints.endpoints.eks_auth.id
    sts        = module.vpc_endpoints.endpoints.sts.id
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

