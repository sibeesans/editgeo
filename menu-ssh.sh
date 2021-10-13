#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'

clear
echo -e ""
echo -e "${GREEN}=================================================================${NC}"
echo -e "${BLUE}======================= ${RED}Menu SSH & OpenVPN ${BLUE}======================${NC}"
echo -e ""
echo -e "- add-ssh      : Create SSH & OpenVPN Account" | lolcat
echo -e "- trial-ssh    : Generate SSH & OpenVPN Trial Account" | lolcat
echo -e "- renew-ssh    : Extending SSH & OpenVPN Account Active Life" | lolcat
echo -e "- del-ssh      : Delete SSH & OpenVPN Account" | lolcat
echo -e "- cek-ssh      : Check User Login SSH & OpenVPN" | lolcat
echo -e "- list-ssh     : Daftar Member SSH & OpenVPN" | lolcat
echo -e "- delete       : Delete User Expired SSH & OpenVPN" | lolcat
echo -e "- autokill     : Set up Autokill SSH" | lolcat
echo -e "- mulog        : Displays Users Who Do Multi Login SSH" | lolcat
echo -e "- restart      : Restart Service Dropbear, Squid3, OpenVPN dan SSH" | lolcat
echo -e ""
echo -e "${GREEN}=================================================================${NC}"
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
add-ssh
;;
2)
trial-ssh
;;
3)
renew-ssh
;;
4)
del-ssh
;;
5)
cek-ssh
;;
6)
list-ssh
;;
7)
cek-pptp
;;
8)
delete
;;
9)
autokill
;;
10)
ceklim
;;
11)
restart
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
