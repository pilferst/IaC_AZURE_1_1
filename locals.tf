locals {
  # Basic tags
  tags = merge({
    Environment = "Development"
    Project     = "IaC_AZURE_1_1"
    Owner       = "AL"
    ManagedBy   = "Terraform"
    Terraform   = "true"
    Repository  = "https://github.com/pilferst/IaC_AZURE_1_1"
  }, var.tags)
}