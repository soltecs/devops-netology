# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gp1tq408bmgrqgmlc1"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1g0hmvh3tve39c8ddp5"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "debian-11-base" {
  default = "fd8t96snb6o4ced44124"
}
