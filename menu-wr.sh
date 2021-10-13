#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
clear
echo -e ""
echo -e "${BLUE}========================= ${RED}Menu Wireguard ${BLUE}========================${NC}"
echo -e ""
echo -e "- add-wg       : Create Wireguard Account" | lolcat
echo -e "- del-wg       : Delete Wireguard Account" | lolcat
echo -e "- cek-wg       : Check User Login Wireguard" | lolcat
echo -e "- renew-wg     : Extending Wireguard Account Active Life" | lolcat
echo -e "- wg show      : Check Wireguard User Interface" | lolcat
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
add-sstp
;;
9)
del-sstp
;;
10)
renew-sstp
;;
11)
cek-sstp
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
