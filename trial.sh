#!/bin/bash
grey='\x1b[90m'
red='\x1b[91m'
green='\x1b[92m'
yellow='\x1b[93m'
blue='\x1b[94m'
purple='\x1b[95m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
flag='\x1b[47;41m'

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

MYIP=$(wget -qO- ipinfo.io/ip);
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
read -p "Masukan Bug" Bug
Login=Trial_`</dev/urandom tr -dc X-Z0-9 | head -c2`
hari="1"
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
Pass=`</dev/urandom tr -dc 0-9 | head -c2`
useradd -e `date -d "1 days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "================================="
echo -e "Trial SSH & OpenVPN"
echo -e "================================="
echo -e " Username       : $Login "
echo -e " Password       : $Pass"
echo -e " Hostname       : $domain${off}"
echo -e "================================="
echo -e " ISP            : $ISP"
echo -e " CITY           : $CITY"
echo -e " COUNTRY        : $COUNTRY"
echo -e " Server IP      : $MYIP"
echo -e " OpenSSH        : 22"
echo -e " Dropbear       : 109, 143"
echo -e " SSL/TLS        :$ssl"
echo -e " WS Dropbear    : 8880"
echo -e " WS OpenSSH     : 2095"
echo -e " WS OpenVPN     : 2082"
echo -e " WS TLS         : 443"
echo -e " Squid          :$sqd"
echo -e " BadVPN         : 7100, 7200, 7300"
echo -e "================================="
echo -e "Configs OpenVPN"
echo -e " TCP $ovpn       : http://$domain:81/TCP.ovpn"
echo -e " UDP $ovpn2       : http://$domain:81/UDP.ovpn"
echo -e " SSL 442        : http://$domain:81/SSL.ovpn"
echo -e " ZIP FILE       : http://$domain:81/ALL.zip"
echo -e "================================="
echo -e "Payload WebSocket"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$Bug:2095@$Login:$Pass"
echo -e "================================="
echo -e " ${green}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe"
echo -e "================================="
echo -e ""
