module "vpc" {
    source = "https://github.com/Raguramgit/Terraform/blob/main/2%20tire/module.tf"
    myvpc = myvpc
    environment = prod
    subnet = subnet
    gateway = gateway
    route_table = route_table
    mysecgroup = mysecgroup
    name = Terraform
}