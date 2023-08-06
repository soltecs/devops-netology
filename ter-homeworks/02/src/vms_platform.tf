###vm web

variable "vm_db_ubuntu_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "yandex compute image family"
}

variable "vm_db_platform_name" {
  type = string
  default = "netology-develop-platform-db"
  description = "yandex compute instance platform name"
}

variable "vm_db_platform_id" {
  type = string
  default = "standard-v2"
  description = "yandex compute instance platform id"
}

variable "vm_db_platform_scheduling_policy_preemptible" {
  type = bool
  default = true
  description = "yandex compute instance platform scheduling policy"
}

variable "vm_db_platform_network_interface_nat" {
  type = bool
  default = true
  description = "yandex compute instance platform network interface nat"
}

variable "vm_db_platform_metadata_serial_port_enable" {
  type = number
  default = 1
  description = "yandex compute instance platform metadata serial-port-enable"
}

variable "vm_db_resources" {
  type    = map
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}