resource "aws_instance" "instance" {
    ami = "ami-0e2612a08262410c8"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]
    associate_public_ip_address = true
    key_name = aws_key_pair.aws_key.key_name

    user_data = <<-EOF
              #!/bin/bash
              yum groupinstall 'Development Tools' -y
              wget -P /root https://busybox.net/downloads/busybox-1.27.2.tar.bz2
              tar -xjf /root/busybox-1.27.2.tar.bz2 -C /root
              cd /root/busybox-1.27.2
              make defconfig
              make
              make install
              chmod u+s /root/busybox-1.27.2/_install/bin/busybox
              export PATH=$PATH:/root/busybox-1.27.2/_install/bin
              mkdir -p /var/www
              echo 'Eden Hazard Blues legend' | tee /var/www/index.html
              cd /var/www
              busybox httpd -f -p 8080 &
              EOF

    tags = {
        Name = "terraform-instance"
    }
}

resource "aws_security_group" "instance" {
    name = "terraform-instance-sg"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}