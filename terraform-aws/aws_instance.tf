
resource "aws_security_group" "allow-ssh" {
    vpc_id = aws_vpc.vpc_custom.id
    name = "allow-ssh"
    description = "to allow ssh and all egress trafic"
    egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      to_port = 0
      protocol = "-1"
    } ]
    ingress = [{
        from_port= 22
        to_port =22
        protocol="-1"
        cidr_block = ["0.0.0.0/0"]
    }]
    tags = {
        Name = "allow-ssh"
    }
}

resource "aws_key_pair" "mykeypair" {
    key_name = "mykeypair"
    public_key = file(keys/mykeypair.pub)
}

resource "aws_instance" "ec2_instance"{
        ami = "ami-0f8ca728008ff5af4"
        instance_type = "t2.micro"
        #vpc subnet
        subnet_id = aws_subnet.vpc-custom-privateSubnet-1.id
        #security group
        vpc_security_group_ids = [aws_security_group.allow-ssh.id]

        #public ssh key
        key_name = aws_key_pair.mykeypair.key_name

        tags = {
                Name="tf-instance-1"
        }
}
