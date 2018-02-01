#! /bin/bash


fping -a -g 172.xxx.xxx.1/24 > IP.txt 2>&1 | grep -v Unrea
#Составляем список активных IP из подсети.

#fping -a -g 172.xxx.xxx.1/24 >> IP.txt 2>&1 | grep -v Unrea
#Если подсетей несколько, можно собрать из них список IP в один файл.

#fping -a -g $1/24 >> IP.txt 2>&1 | grep -v Unrea
#Можно задать подсеть при запуске скрипта