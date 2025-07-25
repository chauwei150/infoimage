# Display dns information
  
output "private_ips" {
  value = aws_instance.http_servers[*].private_ip
}
# Output the public IPs of the instances
output "instance_public_ips" {
  value = aws_instance.http_servers[*].public_ip # Output the public IP of each EIP
}
