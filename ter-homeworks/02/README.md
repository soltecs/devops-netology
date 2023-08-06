# Основы Terraform. Yandex Cloud

1. Задание 1

- Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

```
platform_id указано было некорректно и специфика использования параметров инициализации (минимум 2 ядра для v2)
```

- Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ. Ответ в документации Yandex Cloud.

preemptible - машина выключается через 24 часа принудительно
core_fraction - базовая производительность ядра в процентах

![img_1.png](img_1.png)
![img_2.png](img_2.png)

2. Задание 4

```bash
yurykov@yurykov:~/projects/devops-netology/myrepo/ter-homeworks/02/src$ terraform output
external_ip_address_netology-develop-platform-db_yandex_cloud = "158.160.50.127"
external_ip_address_platform_yandex_cloud = "158.160.99.161"
```
