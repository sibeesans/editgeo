#!/bin/bash

clear
figlet -f slant PREMIUM SCRIPT | lolcat
red='\x1b[91m'
cyan='\x1b[96m'
off='\x1b[m'

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
        echo -e "${red}OS TIDAK SUPPORT !!!${off}"
	echo -e "${red}Scripy Install Hanya Bekerja Pada Operating System Debian, Ubuntu dan Centos${off}"
	exit 0
fi
declare -A nama_bulan
nama_bulan[Jan]="Januari"
nama_bulan[Feb]="Februari"
nama_bulan[Mar]="Maret"
nama_bulan[Apr]="April"
nama_bulan[May]="Mei"
nama_bulan[Jun]="Juni"
nama_bulan[Jul]="Juli"
nama_bulan[Aug]="Agustus"
nama_bulan[Sep]="September"
nama_bulan[Oct]="Oktober"
nama_bulan[Nov]="November"
nama_bulan[Dec]="Desember"
bulan_ini=`date +%b`

color3='\e[031;1m'
color2='\e[34;1m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
COUNTRY=$(curl -s ipinfo.io/country )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(TZ='Asia/Jakarta' date +%R)
hari=$(date +"%A")
tnggl=$(date +"%d")
bln=${nama_bulan[$bulan_ini]}
thn=$(date +"%Y")
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
	
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                    INFORMASI VPS" | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e " ${white}Zona Waktu             :  Asia/Jakarta ${NC}"
echo -e " ${white}Waktu                  :  $jam WIB ${NC}"
echo -e " ${white}Hari                   :  $hari ${NC}"
echo -e " ${white}Tanggal                :  $tnggl $bln $thn ${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e " ${white}Model CPU              : $cname ${NC}"
echo -e " ${white}Nomor Core             :  $cores ${NC}"
echo -e " ${white}Frekuensi CPU          : $freq MHz ${NC}"
echo -e " ${white}Jumlah RAM             :  $tram MB ${NC}"
echo -e " ${white}Jumlah Swap            :  $swap MB ${NC}"
echo -e " ${white}Waktu Aktif            : $up ${NC}"
echo -e " ${white}ISP                    :  $ISP ${NC}"
echo -e " ${white}COUNTRY                :  $COUNTRY ${NC}"
echo -e " ${white}CITY                   :  $CITY ${NC}"
echo -e " ${white}IP VPS                 :  $IPVPS ${NC}"
echo -e " ${white}Host VPS               :  $domain ${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                      MENU TUNNELING " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${white}"
echo -e "[ 01 ] :  Menu SSH & OVPN / WS         "
echo -e "[ 02 ] :  Menu Wireguard               "
echo -e "[ 03 ] :  Menu L2TP / PPTP / SSTP      "
echo -e "[ 04 ] :  Menu Shadowsocks / R         "
echo -e "[ 05 ] :  Menu VMess / VLess           "
echo -e "[ 06 ] :  Menu Trojan                  "
echo -e ""
echo -e "[ 11 ] :  Menu System"
echo -e "${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "  ${white}x =>  Keluar Dari Terminal${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${white}"
read -p " [ # ] Select From Options :  "  num
echo -e "${off}"

case $num in
1)
menu-ssh
;;

2)
menu-wr
;;

3)
menu-l2tp
;;

4)
menu-ssr
;;

5)
menu-v2ray
;;

6)
menu-tr
;;

11)
menu-system
;;

x)
exit
;;
*)
echo -e "${red}Please enter an correct number${off}"
sleep 1
clear
menu
;;
esac