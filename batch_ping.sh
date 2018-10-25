#!/bin/bash
st=210
ed=219
ipfile=machines.Linux.get$st$ed
rm -rf $ipfile
for ((a=$st; a <= $ed ; a++))
do
   #echo "Welcome $a times."
   server=get$a
   #sta=$(ping -c 1 "$server" 2>/dev/null)
   #sta=`ping -c 1 $server ; echo $?`
   #echo $server $sta > pingtest
   ip=`getent hosts "$server" | awk '{print $1}'`
   output=$(ping -c 1 "$server" 2>/dev/null)
   if [ $? -eq 0 ]; then
     echo "$server is up" >> pingtest ; 
     echo $ip >> $ipfile;
     #ip=$(printf '%s' "$output" | gawk -F'[()]' '/PING/{print $2}')  
     #echo "$ip is up";
   else
     echo "$server is down" >> pingtest;
   fi
done

#for i in $(seq 100 170); do echo $i; done
#hh={100..170}
#for x in $hh;do
#echo $x
#done

