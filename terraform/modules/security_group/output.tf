output "id" {
  description = "Id of the created security group"
  value       = [aws_security_group.sg.id]
}

output "name" {
  description = "Id of the created security group"
  value       = aws_security_group.sg.name
}
