resource "yandex_compute_disk" "volumes" {
  count = 3
  size = 1
}

resource "yandex_compute_instance" "storage" {
  name        = "netology-develop-platform-vm-storage"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = 5
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  dynamic "secondary_disk" {
    for_each = [for secondary_disk in yandex_compute_disk.volumes : secondary_disk]

    content {
      disk_id = secondary_disk.value.id
    }
  }
}