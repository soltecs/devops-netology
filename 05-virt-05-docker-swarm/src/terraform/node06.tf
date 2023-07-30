resource "yandex_compute_instance" "node06" {
  name                      = "node06"
  zone                      = "ru-central1-a"
  hostname                  = "node06.netology.yc"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-node06"
      type        = "network-nvme"
      size        = "40"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.default.id}"
    nat        = true
    ip_address = "192.168.101.16"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_yc.pub")}"
    user-data = "#cloud-config\nusers:\n  - name: centos\n    groups: sudo\n    shell: /bin/bash\n    sudo: ['ALL=(ALL) NOPASSWD:ALL']\n    ssh-authorized-keys:\n      - ${file("~/.ssh/id_yc.pub")}"
  }
}
