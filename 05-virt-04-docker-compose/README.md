# Домашнее задание к занятию 4. «Оркестрация группой Docker-контейнеров на примере Docker Compose»

1) Образ Debian:

https://i.imgur.com/VTpOR6m.png

2) Terrafrom apply

```bash
yurykov@yurykov:~/projects/devops-netology/05-virt-04-docker-compose/terraform$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
+ create

Terraform will perform the following actions:

# yandex_compute_instance.node01 will be created
+ resource "yandex_compute_instance" "node01" {
    + allow_stopping_for_update = true
    + created_at                = (known after apply)
    + folder_id                 = (known after apply)
    + fqdn                      = (known after apply)
    + gpu_cluster_id            = (known after apply)
    + hostname                  = "node01.netology.cloud"
    + id                        = (known after apply)
    + metadata                  = {
        + "ssh-keys"  = <<-EOT
          yurykov:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILUxsKXfb0jsvVms1fek3bYVgTH9IE2eSw1p18Xavscb yurykov@yurykov
          EOT
        + "user-data" = <<-EOT
          #cloud-config
          users:
          - name: yurykov
          groups: sudo
          shell: /bin/bash
          sudo: ['ALL=(ALL) NOPASSWD:ALL']
          ssh-authorized-keys:
          - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILUxsKXfb0jsvVms1fek3bYVgTH9IE2eSw1p18Xavscb yurykov@yurykov
          EOT
          }
    + name                      = "node01"
    + network_acceleration_type = "standard"
    + platform_id               = "standard-v1"
    + service_account_id        = (known after apply)
    + status                    = (known after apply)
    + zone                      = "ru-central1-a"

    + boot_disk {
        + auto_delete = true
        + device_name = (known after apply)
        + disk_id     = (known after apply)
        + mode        = (known after apply)

        + initialize_params {
            + block_size  = (known after apply)
            + description = (known after apply)
            + image_id    = "fd8t96snb6o4ced44124"
            + name        = "root-node01"
            + size        = 50
            + snapshot_id = (known after apply)
            + type        = "network-nvme"
              }
              }

    + network_interface {
        + index              = (known after apply)
        + ip_address         = (known after apply)
        + ipv4               = true
        + ipv6               = (known after apply)
        + ipv6_address       = (known after apply)
        + mac_address        = (known after apply)
        + nat                = true
        + nat_ip_address     = (known after apply)
        + nat_ip_version     = (known after apply)
        + security_group_ids = (known after apply)
        + subnet_id          = (known after apply)
          }

    + resources {
        + core_fraction = 100
        + cores         = 8
        + memory        = 8
          }
          }

# yandex_vpc_network.default will be created
+ resource "yandex_vpc_network" "default" {
    + created_at                = (known after apply)
    + default_security_group_id = (known after apply)
    + folder_id                 = (known after apply)
    + id                        = (known after apply)
    + labels                    = (known after apply)
    + name                      = "net"
    + subnet_ids                = (known after apply)
      }

# yandex_vpc_subnet.default will be created
+ resource "yandex_vpc_subnet" "default" {
    + created_at     = (known after apply)
    + folder_id      = (known after apply)
    + id             = (known after apply)
    + labels         = (known after apply)
    + name           = "subnet"
    + network_id     = (known after apply)
    + v4_cidr_blocks = [
        + "192.168.101.0/24",
          ]
    + v6_cidr_blocks = (known after apply)
    + zone           = "ru-central1-a"
      }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
+ external_ip_address_node01_yandex_cloud = (known after apply)
+ internal_ip_address_node01_yandex_cloud = (known after apply)

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value: yes

yandex_vpc_network.default: Creating...
yandex_vpc_network.default: Creation complete after 2s [id=enp8ha50ksjqhd368ghf]
yandex_vpc_subnet.default: Creating...
yandex_vpc_subnet.default: Creation complete after 1s [id=e9bdsvprc4gdkluaip12]
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node01: Still creating... [50s elapsed]
yandex_compute_instance.node01: Still creating... [1m0s elapsed]
yandex_compute_instance.node01: Creation complete after 1m8s [id=fhm9b9kvkovjqkep8b1u]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_node01_yandex_cloud = "51.250.85.5"
internal_ip_address_node01_yandex_cloud = "192.168.101.28"
```

Скриншот:
https://i.imgur.com/6vWBitl.png


3) Docker ps

```bash
yurykov@node01:~$ sudo  docker ps
CONTAINER ID   IMAGE                              COMMAND                  CREATED          STATUS                             PORTS                                                                              NAMES
92d1370c554b   prom/pushgateway:v1.2.0            "/bin/pushgateway"       38 seconds ago   Up 25 seconds                      9091/tcp                                                                           pushgateway
8b91a082fb10   prom/alertmanager:v0.20.0          "/bin/alertmanager -…"   38 seconds ago   Up 25 seconds                      9093/tcp                                                                           alertmanager
e59424a64fba   stefanprodan/caddy                 "/sbin/tini -- caddy…"   38 seconds ago   Up 25 seconds                      0.0.0.0:3000->3000/tcp, 0.0.0.0:9090-9091->9090-9091/tcp, 0.0.0.0:9093->9093/tcp   caddy
c5b1bd773d22   gcr.io/cadvisor/cadvisor:v0.47.0   "/usr/bin/cadvisor -…"   38 seconds ago   Up 25 seconds (health: starting)   8080/tcp                                                                           cadvisor
081e772a0c09   prom/prometheus:v2.17.1            "/bin/prometheus --c…"   38 seconds ago   Up 25 seconds                      9090/tcp                                                                           prometheus
f9f0cb419ac6   grafana/grafana:7.4.2              "/run.sh"                38 seconds ago   Up 25 seconds                      3000/tcp                                                                           grafana
04c48e4ae89c   prom/node-exporter:v0.18.1         "/bin/node_exporter …"   38 seconds ago   Up 25 seconds                      9100/tcp                                                                           nodeexporter
yurykov@node01:~$
```

4) Monitor

Screenshot: https://i.imgur.com/jLTMZgI.png