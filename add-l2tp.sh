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


ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

#MYIP=$(wget -qO- ipinfo.io/ip);
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(cat /etc/v2ray/domain);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e VPN_USER
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-l2tp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
read -p "Password: " VPN_PASSWORD
read -p "Expired (hari): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
clear

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" l2tpd "$VPN_PASSWORD" *
EOF

VPN_PASSWORD_ENC=$(openssl passwd -1 "$VPN_PASSWORD")
cat >> /etc/ipsec.d/passwd <<EOF
$VPN_USER:$VPN_PASSWORD_ENC:xauth-psk
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-l2tp"

echo -e ""
echo -e "${blue}================================${off}"
echo -e "${purple} ~> L2TP/IPSEC${off}"
echo -e "${blue}================================${off}"
echo -e " ${green}ISP           : $ISP"
echo -e " CITY          : $CITY"
echo -e " COUNTRY       : $COUNTRY"
echo -e " Server IP     : $MYIP"
echo -e " Server Host   : $PUBLIC_IP"
echo -e " IPSec PSK     : myvpn"
echo -e " Username      : $VPN_USER"
echo -e " Password      : $VPN_PASSWORD${off}"
echo -e "${blue}================================${off}"
echo -e " ${green}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "${blue}=================================${off}"
echo -e ""
