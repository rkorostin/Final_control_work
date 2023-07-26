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

![pass_mysql](https://github.com/rkorostin/Images/blob/main/fcw/mysql_pass.PNG)

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

![phpmyadmin](https://github.com/rkorostin/Images/blob/main/fcw/phpmyadmin-viewdb.PNG)

8. Создание таблиц в БД согласно пункту №6:
```
USE Friends_of_Human;
CREATE TABLE Animal (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    command VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE DomesticAnimal (
    id INT NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (id) REFERENCES Animal(id),
    PRIMARY KEY (id)
);

CREATE TABLE Dog (
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES DomesticAnimal(id),
    PRIMARY KEY (id)
);

CREATE TABLE Cat (
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES DomesticAnimal(id),
    PRIMARY KEY (id)
);

CREATE TABLE Hamster (
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES DomesticAnimal(id),
    PRIMARY KEY (id)
);

CREATE TABLE DraughtAnimal (
    id INT NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (id) REFERENCES Animal(id),
    PRIMARY KEY (id)
);

CREATE TABLE Horse (
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES DraughtAnimal(id),
    PRIMARY KEY (id)
);

CREATE TABLE Camel (
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES DraughtAnimal(id),
    PRIMARY KEY (id)
);

CREATE TABLE Donkey (
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES DraughtAnimal(id),
    PRIMARY KEY (id)
);
```
![Create_Tables](https://github.com/rkorostin/Images/blob/main/fcw/Create_Tables.PNG)

9. Заполнение таблиц данными:
```
INSERT INTO Dog (id) VALUES (1);
INSERT INTO Animal (name, command, birthdate) VALUES ('Rex', 'Sit, Stay, Roll over', '2018-05-12');
UPDATE Animal SET birthdate = '2017-05-12' WHERE name = 'Rex';

INSERT INTO Cat (id) VALUES (2);
INSERT INTO Animal (name, command, birthdate) VALUES ('Whiskers', 'Meow, Scratch', '2019-02-14');
UPDATE Animal SET birthdate = '2018-02-14' WHERE name = 'Whiskers';

INSERT INTO Hamster (id) VALUES (3);
INSERT INTO Animal (name, command, birthdate) VALUES ('Nibbles', 'Run on wheel', '2020-01-01');
UPDATE Animal SET birthdate = '2019-01-01' WHERE name = 'Nibbles';

INSERT INTO Horse (id) VALUES (4);
INSERT INTO Animal (name, command, birthdate) VALUES ('Thunder', 'Giddy up, Whoa', '2015-07-20');
UPDATE Animal SET birthdate = '2014-07-20' WHERE name = 'Thunder';

INSERT INTO Camel (id) VALUES (5);
INSERT INTO Animal (name, command, birthdate) VALUES ('Sahara', 'Walk, Spit', '2016-11-11');
UPDATE Animal SET birthdate = '2015-11-11' WHERE name = 'Sahara';

INSERT INTO Donkey (id) VALUES (6);
INSERT INTO Animal (name, command, birthdate) VALUES ('Eeyore', 'Bray, Carry load', '2017-03-17');
UPDATE Animal SET birthdate = '2016-03-17' WHERE name = 'Eeyore';
```
![Insert_Tables](https://github.com/rkorostin/Images/blob/main/fcw/Insert_Tables.PNG)