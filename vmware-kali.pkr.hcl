packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.3"
      source = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "basic-example" {
  iso_url = "https://cdimage.kali.org/kali-2022.3/kali-linux-2022.3-live-amd64.iso"
  iso_checksum = "sha256:f87618a6df20b6fdf4edebee1c6f1d808dee075a431229b3f75a5208e3c9c0e8"
  ssh_username = "kali"
  ssh_password = "kali"
  shutdown_command ="shutdown -P now"
}

build {
  name = "incredibly-fruitful"
  sources = ["sources.vmware-iso.basic-example"]
  provisioner "shell" {
    inline = [
      "echo Update de kali linux",
      "sudo apt-get update -y",
      "sudo apt-get dist-upgrade -y", 
      "update && upgrade over see you next time",
    ]
  }
}




