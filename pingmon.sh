
#!/bin/bash
HOSTS="10.56.18.4"
COUNT=4
for myHost in $HOSTS
do
count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
if [ $count -eq 0 ]; then
# 100% failed
echo "Server failed at $(date)" | mail -s "SFA esxi Server is down" dustin@ntuplesolutions.com
echo "Host : $myHost is down (ping failed) at $(date)"
fi
done

