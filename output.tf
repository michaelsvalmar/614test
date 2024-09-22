output "instance_ip_addr" {
  value = aws_instance.my_server.private_ip
}

# Solution - Output Public IP
 output "public_ip" {
  value = aws_instance.my_server.public_ip
}
