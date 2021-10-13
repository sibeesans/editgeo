#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo "Untuk Melakukan Tindakan Ini, Anda Harus Laporan Terlebih Dahulu Kepada Pihak Admin."
echo "Agar Diberikan Akses Pembaruan Pada Script VPS Anda!"
read -p "Sudah Laporan? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'N' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
elif [[ $arg == 'n' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
else
  echo "Argumen Tidak Diketahui!"
  sleep 1
  clear
  neofetch
  exit 0
fi
sleep 1
cd /usr/bin
wget -O menu https://raw.githubusercontent.com/geogabut/DorkScript/main/menu.sh && chmod +x menu 
wget -O menu-ssh https://raw.githubusercontent.com/geogabut/DorkScript/main/menu-ssh.sh && chmod +x menu-ssh
