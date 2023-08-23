#создаем 2 ВМ с разными ресурсами
resource "yandex_compute_instance" "vm_foreach_resource" {
  for_each   = { for x in var.vm_list: x.vm_name => x }

  name        = "netology-develop-platform-web-${each.value.vm_name}"
  platform_id = "standard-v1"

  resources {
    cores         = "${each.value.cpu}"
    memory        = "${each.value.ram}"
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = "${each.value.disk}"
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.admin_ssh_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true

  depends_on = [
    yandex_compute_instance.vm_count
  ]
}
