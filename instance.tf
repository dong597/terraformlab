resource "aws_instance" "instance" {
    ami = "ami-0e2612a08262410c8"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]
    associate_public_ip_address = true

    user_data = <<-EOF
    #!/bin/bash
    dnf -y install busybox
    echo "hello world" > /var/www/html/index.html
    nohup busybox httpd -f -p 8080 &
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

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}