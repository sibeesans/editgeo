#!/bin/bash
clear
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                        MENU SYSTEM " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${white}"
echo -e " 1 =>  Masukkan Host          12 =>  Limit Speed"
echo -e " 2 =>  Record Domain          13 =>  Ram VPS"
echo -e " 3 =>  Sertifikat V2RAY       14 =>  Ganti Password"
echo -e " 4 =>  Ubah Port VPN          15 =>  Reboot"
echo -e " 5 =>  Autobackup VPS         16 =>  Speedtest"
echo -e " 6 =>  Backup VPS             17 =>  Informasi System"
echo -e " 7 =>  Restore VPS            18 =>  Info Script"
echo -e " 8 =>  Menu Webmin            19 =>  Restart Service"
echo -e " 9 =>  Auto Reboot            20 =>  Multi Login SSH"
echo -e " 10 =>  Edit Banner SSH       21 =>  Restart Script"
echo -e " 11 =>  Status Service        22 Monitor Bandwith"
echo -e "${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${white}"
read -p " [ # ] Masukkan Nomor Pilihanmu :  "  num
echo -e "${off}"
case $num in
1)
add-host
;;

2)
hostnya
;;

3)
certv2ray
;;

4)
panel-port
;;

5)
autobackup
;;

6)
backup
;;

7)
restore
;;

8)
wbmn
;;

9)
auto-reboot
;;

10)
nano /etc/issue.net
;;

11)
status
;;

12)
limit-speed
;;

13)
ram
;;

14)
passwd
;;

15)
reboot
;;

16)
speedtest
;;

17)
info
;;

18)
about
;;

19)
restart
;;

20)
autokill
;;

21)
updatee
;;

22)
bw
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
