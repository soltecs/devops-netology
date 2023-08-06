###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILUxsKXfb0jsvVms1fek3bYVgTH9IE2eSw1p18Xavscb "
  description = "ssh-keygen -t ed25519"
}

variable "vms_metadata" {
  type = map
  default = {
    serial-port-enable = 1
    ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILUxsKXfb0jsvVms1fek3bYVgTH9IE2eSw1p18Xavscb "
  }
}

###vm web

variable "vm_web_ubuntu_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image family"
}

variable "vm_web_platform_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex compute instance platform name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "yandex compute instance platform id"
}

variable "vm_web_platform_scheduling_policy_preemptible" {
  type        = bool
  default     = true
  description = "yandex compute instance platform scheduling policy"
}

variable "vm_web_platform_network_interface_nat" {
  type        = bool
  default     = true
  description = "yandex compute instance platform network interface nat"
}

variable "vm_web_platform_metadata_serial_port_enable" {
  type        = number
  default     = 1
  description = "yandex compute instance platform metadata serial-port-enable"
}

variable "vm_web_resource" {
  type = map
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
}

