## switch_auto_config
#### Скрипт выполнения команд на большом количестве коммутаторов одной модели. В данном случае, на коммутаторах D-Link.


### Последовательность выполнения:
### Шаг 1

#### Собираем IP активных устройств в сети (2 способа):

#### 1:
```
./ip_search.sh 192.168.10.1/24
```

#### 2:
#### Прописываем свою подсеть в файле ./ip_search.sh:

```
fping -a -g 172.xxx.xxx.1/24 > IP.txt 2>&1 | grep -v Unrea
```
#### Результатом выполнения будет файл IP.txt со списком доступных на сети IP-адресов коммутаторов.
#### Это выглядит примерно так:
```
192.xxx.xxx.1
192.xxx.xxx.xxx
192.xxx.xxx.xxx
192.xxx.xxx.254
```

### Шаг 2
#### Правим файл switch_auto_commander.sh в следующих местах
```
   snmp_result=`snmpget -v2c -c public $ip 1.3.6.1.2.1.1.1.0` #search switch model
   if echo $snmp_result|grep -q 'DES-3028' #your_model_switch (DES-3200-10, DES-3200-18...) 

   {
    echo #your_login
    echo #your_password
    echo
    echo #your_command 1
    echo
    echo #your_command 2
    echo
    echo #your_command ...
    echo
    sleep 1
    echo
    echo save
    sleep 15
    echo
    echo logout
    }
```
### Шаг 3
#### Запускаем файл switch_auto_commander.sh:
```
./switch_auto_commander.sh
```
