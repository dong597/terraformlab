output "floatingIP" {
    value = aws_instance.instance.public_ip  
}

