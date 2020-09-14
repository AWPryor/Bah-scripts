#! /bin/bash

echo "Please enter an ip range"
read ip
sudo nmap -A -p80 --open $ip -oG nmap-scan
for ip in $(cat nmap-scan | grep 80 |grep -v "Nmap" | awk       '{print $2}'); do cutycapt --url=$ip --out=/home/kali/Desktop/OSCP/challenge/Images/$ip.png; done
cd /home/kali/Desktop/OSCP/challenge/Images/
echo "<HTML><BODY><BR>" > web.html
ls -1 *.png | awk -F : '{print $1":\n<BR><IMG SRC=\""$1""$2"\" width=600><BR>"}' >> web.html 
echo "</BODY></HTML>" >> web.html 
firefox web.html 

