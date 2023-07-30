# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  #service_account_key_file = "key.json"
  token = "y0_AgAAAABvtmFpAATuwQAAAADo-A3FlZfgT19jR2yx9UCWqT6SfWuVlh8"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
