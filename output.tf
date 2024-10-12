resource "time_sleep" "wait" {
  create_duration = "160s"
}

output "floatingIP" {
    value = aws_instance.instance.public_ip  
}