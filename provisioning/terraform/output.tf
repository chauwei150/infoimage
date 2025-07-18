# Display dns information
  
output "http_ip1" {
  value = {
    for instance in aws_instance.http1 :
    instance.id => instance.private_ip
  }
}

output "http_ip4" {
  value = {
    for instance in aws_instance.http4 :
    instance.id => instance.private_ip
  }
}
