#resource "terraform_data" "myvm1data" {
#  connection {
#    type = "ssh"
#    user = "ec2-user"
#    private_key = "${file("/root/terraformlab/lab5_aws/awskey.pem")}"
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
#      "yum groupinstall 'Development Tools' -y",
#      "sudo wget -P /root https://busybox.net/downloads/busybox-1.27.2.tar.bz2",  # 루트 디렉토리에 다운로드
#      "sudo tar -xjf /root/busybox-1.27.2.tar.bz2 -C /root",  # 루트 디렉토리에서 압축 해제
#      "cd /root/busybox-1.27.2",
#      "make defconfig",
#      "make",
#      "make install",
#      "chmod u+s /root/busybox-1.27.2/_install/bin/busybox",  # setuid 설정
#      "export PATH=\\$PATH:/root/busybox-1.27.2/_install/bin",
#      "mkdir -p /var/www",
#      "echo 'hello world' | tee /var/www/index.html",
#      "/root/busybox-1.27.2/_install/bin/busybox httpd -f -p 8080 &"  # 경로를 명시적으로 지정
#    ]
#  }
#
#
#  triggers_replace = [
#    aws_instance.instance.public_ip 
#  ]
#}
#  
#
