module "vpc" {
    source = "../modules"
    myvpc = myvpc
    environment = prod
    subnet = subnet
    gateway = gateway
    route_table = route_table
    mysecgroup = mysecgroup
    name = Terraform
}