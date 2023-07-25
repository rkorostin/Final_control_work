# Организовать систему учёта для питомника, в котором живут домашние и вьючные животные.

1. Создание файлов с помощью команды cat:
```
$> cat > Домашние_животные.txt
собака
кошка
хомяк
^C

$> cat > Вьючные_животные.txt
лошадь
верблюд
осел
^C
```

Объединение файлов:
```
$> cat Домашние_животные.txt Вьючные_животные.txt > Друзья_человека.txt
```
Просмотр содержимого файла:
```
$> cat Друзья_человека.txt
```
Переименование файла:
```
$> mv Друзья_человека.txt Friends_of_Human.txt
```
2. Создание директории и перемещение файла:
```
$> mkdir Nursery
$> mv Friends_of_Human.txt Nursery/
```
3. Для добавления репозитория MySQL используем guide - https://downloads.mysql.com/docs/mysql-apt-repo-quick-guide-en.a4.pdf

Скачиваем deb пакет и устанавливаем:
```
$> wget https://repo.mysql.com//mysql-apt-config_0.8.26-1_all.deb
$> sudo dpkg -i mysql-apt-config_0.8.26-1_all.deb
```
Получаем последнюю информацию о пакете из репозитория MySQL APT:
```
$> sudo apt-get update
Сущ:1 http://ru.archive.ubuntu.com/ubuntu jammy InRelease
Сущ:2 http://ru.archive.ubuntu.com/ubuntu jammy-updates InRelease
Сущ:3 http://ru.archive.ubuntu.com/ubuntu jammy-backports InRelease
Сущ:4 http://repo.mysql.com/apt/ubuntu jammy InRelease
Сущ:5 http://ru.archive.ubuntu.com/ubuntu jammy-security InRelease
Чтение списков пакетов… Готово
```
Теперь можно устанавливать пакеты из репозитория MySQL. Так как в следующих заданиях предполагается работать с БД, то установим пакет **mysql-server**:
```
$> sudo apt-get install mysql-server
```
На этапе установки задаём пароль, далее ставим с рекомендуемыми параметрами.

![node2](https://github.com/rkorostin/Images/blob/main/container/hw5/node1_adminer.png)

Проверяем версию:
```
$> mysqld --version
/usr/sbin/mysqld  Ver 8.0.34 for Linux on x86_64 (MySQL Community Server - GPL)
```
Проверяем состояние:
```
$> systemctl status mysql
● mysql.service - MySQL Community Server
     Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset:>
     Active: active (running) since Tue 2023-07-25 15:53:19 MSK; 9min ago
       Docs: man:mysqld(8)
             http://dev.mysql.com/doc/refman/en/using-systemd.html
   Main PID: 3280 (mysqld)
     Status: "Server is operational"
      Tasks: 39 (limit: 6956)
     Memory: 364.4M
        CPU: 4.505s
     CGroup: /system.slice/mysql.service
             └─3280 /usr/sbin/mysqld
```
4. Установить и удалить deb-пакет с помощью dpkg. 

Какой пакет именно устанавливать - вопрос к методологам, что они подразумевали, я не понял. Но тем не менее, задание вроде простое.

Установка:
```
$> sudo dpkg -i <имя пакета>.deb
```
Удаление:
```
$> sudo dpkg -r <имя пакета>
```
5. История команд:
```
$> history
```
6. Диаграмма классов:

```
Animal
├── DomesticAnimal
│   ├── Dog
│   ├── Cat
│   └── Hamster
└── DraughtAnimal
    ├── Horse
    ├── Camel
    └── Donkey
```
7. Создание базы данных "Друзья человека" в MySQL:
```
$> mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.34 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Friends_of_Human;
Query OK, 1 row affected (0,01 sec)
```
Для визуализации БД установим phpmyadmin (во время установки выбираем веб apache2 и задаём пароли для доступа):
```
$> sudo apt install phpmyadmin
```
Устанавливаем модуль PHP для Apache:
```
$> sudo apt install libapache2-mod-php
```
Теперь можно управлять БД через браузер:

![node2](https://github.com/rkorostin/Images/blob/main/container/hw5/node1_adminer.png)