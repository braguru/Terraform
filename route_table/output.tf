# output "igw_id" {
#   value = data.aws_internet_gateway.default.id
# }

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}