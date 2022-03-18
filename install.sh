#! /usr/bin/env bash
echo "Installando dipendenze"
sudo apt-get install git raspberrypi-kernel-headers build-essential dkms -y
sudo echo # pre-authorise sudo
echo "Clonando driver"
git clone https://github.com/fragarray/rtl8192eu-linux-driver-rasp.git
cd rtl8192eu-linux-driver-rasp
echo "Aggiungendo DKMS"
sudo dkms add .
echo "Installando dkms"
sudo dkms install rtl8192eu/1.0
echo "DKMS compilato ed installato"
echo "Operazioni finali"
echo -e "8192eu\n\nloop" | sudo tee /etc/modules
echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf
echo "UPDATE INITRAMS"
sudo update-initramfs -u
