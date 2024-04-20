packer {
    required_plugins {
        yandex = {
            version = "~> 1"
            source = "github.com/hashicorp/yandex"
        }
    }
}

source "yandex" "ubuntu-nginx" {
    token               = ""
    folder_id           = "b1g7i1ahrh2lvqf17o4t"
    source_image_family = "ubuntu-2004-lts"
    ssh_username        = "ubuntu"
    use_ipv4_nat        = "true"
    image_description   = "Мой первый образ в пакере"
    image_family        = "ubuntu-2004-lts"
    image_name          = "my-ubuntu-nginx"
    subnet_id           = "e9bmj011mji16g5nrp8m"
    disk_type           = "network-hdd"
    zone                = "ru-central1-a"
}


build {
    sources = ["source.yandex.ubuntu-nginx"]

    provisioner "shell" {
        inline = ["sudo apt-get update -y",
                  "sudo apt-get install -y nginx",
                  "sudo systemctl enable nginx.service"]
    }
}