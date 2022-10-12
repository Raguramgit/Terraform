variable  "myvpc" {
    default = "myvpc"
    type = string
}
variable "environment"{
    default = "prod"
    type = string
}
variable "subnet" {
    default = "subnet"
    type = string
}
variable "gateway" {
    default = "gateway"
    type = string
}
variable "route_table" {
    default = "route_table"
    type = string
}
variable "mysecgroup" {
    default = "mysecgroup"
    type = string
}
variable "name" {
    default = "Terraform"
    type = string
}