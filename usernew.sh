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

MYIP=$(wget -qO- icanhazip.com);
echo -e  "${red}Checking VPS${NC}"
sleep 2
IZIN=$(curl https://raw.githubusercontent.com/sibeesans/DorkScript/main/ipvps | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
sleep 2 
else
clear
echo -e ""
echo -e "======================================="
echo -e "${red}===[ Permission Denied...!!! ]===${NC}";
echo -e "Contact WA https//wa.me/+6285717614888"
echo -e "For Registration IP VPS"
echo -e "======================================="
echo -e ""
exit 0
fi

# DELETE AKUN EXPIRED
               hariini=`date +%Y-%m-%d`
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
               
               userdel $username
               fi
               done
# DELETE

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

#MYIP=$(wget -qO- ipinfo.io/ip);
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Masukan Bug" Bug
read -p "Expired (hari): " masaaktif

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
sleep 1
echo "Akun Berhasil Dibuat!"
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "================================="
echo -e "SSH & OpenVPN"
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
