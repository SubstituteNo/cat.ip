#!/usr/bin/bash
# check host status
#v1
for i in {1..254}
do
{
ip=192.168.4.$i
ping -c 2 -W 1 $ip &> /dev/null
if [ $? -eq  0 ]; then
echo "$ip is online" | tee -a /tmp/host_online.txt
else
# echo "$ip is offline" | tee -a /tmp/host_offline.txt
echo "$ip is offline" &> /dev/null
fi
} &
done
wait
