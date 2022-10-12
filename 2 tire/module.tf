module "vpc" {
    source = "https://github.com/Raguramgit/Terraform/tree/main/2%20tire"
    myvpc = myvpc
    environment = prod
    subnet = subnet
    gateway = gateway
    route_table = route_table
    mysecgroup = mysecgroup
    name = Terraform
}