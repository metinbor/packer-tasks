packer {
	required_plugins {
		amazon = {
			version = ">= 0.0.1"
			source = "github.com/hashicorp/amazon"
		}
	}
}


variable "ssh_private_key_file" {
	default = "~/.ssh/id_rsa"
}
variable "ssh_keypair_name" {
	default = "packer"
}
variable "source_ami_name" {
	default = "CentOS Linux 7 x86_64 HVM EBS ENA 1901_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-*"
}
variable "instance_type" {
	default = "t2.micro"
}
variable "ssh_username" {
	default = "centos"
}
variable "ami_name" {
	default = "jenkins"
}
variable "region" { 
default = " "
}
variable "owners" {
	default = "679593333241"
}
variable "jenkins_version" {
	default = "jenkins"
}

variable "java_version" {
	default = "-1.8.0-openjdk-devel"
}

variable "ami_regions" { 
	type = list(string) 
	
 }

variable "account_ids" {
    default = [ 
	"713287746880",  # Farrukhs account 
    ]
}

source "amazon-ebs" "image" {
	ami_name             = "${var.ami_name} {{timestamp}}"
	ssh_private_key_file = "${var.ssh_private_key_file}"
	ssh_keypair_name     = "${var.ssh_keypair_name}"
	instance_type        = "${var.instance_type}"
	ssh_username         = "${var.ssh_username}"
	region               = "${var.region}"
    ami_regions          = "${var.ami_regions}"
    ami_users            = "${var.account_ids}"
	security_group_id = "var.sg"
	user_data_file = "./user_data.sh"
	source_ami_filter {
		most_recent = true
		owners      = ["${var.owners}"]
		filters = {
			name                = "${var.source_ami_name}"
			virtualization-type = "hvm"
			root-device-type    = "ebs"
		}
	}

	run_tags = {
		Name = "jenkins instance for ${var.source_ami_name}"
	}
}


build {
	sources = [
		"source.amazon-ebs.image"
	]

	provisioner "breakpoint" {
		note = "Waiting for your verification"
	}
}