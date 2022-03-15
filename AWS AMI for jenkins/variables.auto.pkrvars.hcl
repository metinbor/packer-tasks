ssh_private_key_file = "/home/ec2-user/.ssh/id_rsa"
ssh_keypair_name     = "packer"
ami_name             = "jenkins"
region               = "us-east-2"
instance_type        = "t2.micro"
java_version         = "-1.8.0-openjdk-devel"
jenkins_version      = "jenkins"
ami_regions          = [ "us-east-1", "ca-central-1" ]


# OS specific settings
source_ami_name = "CentOS Linux 7 x86_64 HVM EBS ENA 1901_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-*"
ssh_username    = "centos"
owners          = "679593333241"