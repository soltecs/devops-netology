#считываем данные об образе ОС
data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts"
}

#создаем 2 идентичные ВМ
resource "yandex_compute_instance" "vm_count" {
  name        = "netology-develop-platform-web-${count.index+1}"
  platform_id = "standard-v1"

  count = 2

  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.admin_ssh_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = ["${yandex_vpc_security_group.example.id}"]
    nat       = true
  }
  allow_stopping_for_update = true
}
