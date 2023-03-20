module "vpc" {
    source = "git::https://github.com/vdps007/tf-module-vpc.git"
    env= var.env
    tags = var.tags
    default_route_table = var.default_route_table
    default_vpc_id      = var.default_vpc_id

    for_each = var.vpc
    vpc_cidr = each.value["vpc_cidr"]
    public_subnets  = each.value["public_subnets"]
    private_subnets = each.value["private_subnets"]

}

output "vpc" {
  value = local.db_subnet_ids
}
