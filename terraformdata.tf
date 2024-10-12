#resource "terraform_data" "myvm1data" {
#  connection {
#    type = "ssh"
#    user = "ec2-user"
#    private_key = file("/root/terraformlab/lab5_aws/awskey.pem")
#    host =  aws_instance.instance.public_ip 
#  }
#
#  provisioner "file" {
#    source = "/root/terraformlab/lab5_aws/httpd.conf"
#    destination = "/tmp/httpd.conf"
#  }
#
#  provisioner "remote-exec" {
#    inline = [
#      "sudo yum -y install httpd" ,
#      "echo 'Eden Hazard Blues legend' | sudo tee /var/www/html/index.html",
#      "sudo mv /tmp/httpd.conf /etc/httpd/conf/httpd.conf",
#      "sudo systemctl start httpd" 
#      ]
#  }
#
#  triggers_replace = [ 
#    aws_instance.instance.public_ip 
#  ]
#}
