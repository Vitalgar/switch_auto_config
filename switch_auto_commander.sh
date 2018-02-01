#! /bin/bash
statline=in_progress

cat IP.txt|while read ip 
do
   snmp_result=`snmpget -v2c -c public $ip 1.3.6.1.2.1.1.1.0` #search switch model
   if echo $snmp_result|grep -q 'DES-3028' #if model is "DES-3028": 
   then
   echo $statline $ip

#create file commands

   {
    echo #login
    echo #password
    echo
    echo create vlan mgmt1178 tag 1178
    echo
    echo config vlan vlanid 1178 add tagged 25-28
    echo
    sleep 1
    echo
    echo save
    sleep 15
    echo
    echo logout
    } >"${ip}.cfg"
    echo ${ip}.cfg

#send commands to switch

    cat "${ip}.cfg"|netcat -i 1 -w 10  $ip 23 >"${ip}.log" &
    sleep 0.1

#if model isn't "DES-3028":

   else 
    echo $snmp_result
   fi
done