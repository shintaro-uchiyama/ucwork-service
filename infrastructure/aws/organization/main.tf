resource "aws_s3_bucket" "terraform_state" {
  bucket = "ucwork-root-admin-tfstate"
  versioning {
    enabled = true
  }
}

data "aws_organizations_organization" "root" {}
locals {
  root_id = data.aws_organizations_organization.root.roots[0].id
}

resource aws_organizations_organizational_unit base_organization_unit {
  name = "base organization unit"
  parent_id = local.root_id
}

/*
module "base_organization_unit" {
  source = "../modules/management/base_organization_unit"
  parent_organization_id = aws_organizations_organization.org.roots[0].id
  account_name = "shintaro"
  account_email = "shintaro.a.uchiyama+aa@gmail.com"
}

resource aws_organizations_account org_account {
  name  = "org_account"
  email = "shintaro.a.uchiyama+arg_account@gmail.com"
}
*/

/*
# organization
module "organization" {
  source = "../modules/management/organization"
}

# base organization unit
module "base_organization_unit" {
  source = "../modules/management/base_organization_unit"
  parent_organization_id = aws_organizations_organization.org.roots[0].id
  account_name = "shintaro"
  account_email = "shintaro.a.uchiyama+aa@gmail.com"
}

# infra
module "infra_organization_unit" {
  source = "../modules/management/organization_unit"
  name = "infra"
  parent_organization_unit_id = module.base_organization_unit.core_organization_unit_id
}

module "infra_organization_unit_production" {
  source = "../modules/management/organization_unit"
  name = "infra production"
  parent_organization_unit_id = module.infra_organization_unit.organization_unit_id
}

module "infra_production_account" {
  source = "../modules/identity/iam"
  name = "shintaro.a.uchiyama+infra-production@gmail.com"
  email = "shintaro.a.uchiyama+infra-production@gmail.com"
  parent_organization_unit_id = module.infra_organization_unit_production.organization_unit_id
}

module "infra_organization_unit_sdlc" {
  source = "../modules/management/organization_unit"
  name = "infra sdlc"
  parent_organization_unit_id = module.infra_organization_unit.organization_unit_id
}

module "infra_sdlc_account" {
  source = "../modules/identity/iam"
  name = "shintaro.a.uchiyama+infra-sdlc@gmail.com"
  email = "shintaro.a.uchiyama+infra-sdlc@gmail.com"
  parent_organization_unit_id = module.infra_organization_unit_sdlc.organization_unit_id
}

# security
module "security_organization_unit" {
  source = "../modules/management/organization_unit"
  name = "infra"
  parent_organization_unit_id = module.base_organization_unit.core_organization_unit_id
}

module "security_organization_unit_production" {
  source = "../modules/management/organization_unit"
  name = "security production"
  parent_organization_unit_id = module.security_organization_unit.organization_unit_id
}

module "security_production_account" {
  source = "../modules/identity/iam"
  name = "shintaro.a.uchiyama+security-production@gmail.com"
  email = "shintaro.a.uchiyama+security-production@gmail.com"
  parent_organization_unit_id = module.security_organization_unit_production.organization_unit_id
}

module "security_organization_unit_sdlc" {
  source = "../modules/management/organization_unit"
  name = "security sdlc"
  parent_organization_unit_id = module.security_organization_unit.organization_unit_id
}

module "security_sdlc_account" {
  source = "../modules/identity/iam"
  name = "shintaro.a.uchiyama+security-sdlc@gmail.com"
  email = "shintaro.a.uchiyama+security-sdlc@gmail.com"
  parent_organization_unit_id = module.security_organization_unit_sdlc.organization_unit_id
}
*/