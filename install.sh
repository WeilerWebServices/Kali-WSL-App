#!/bin/bash

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'
echo " "
echo -e "${CYAN}  ____  __.      .__  .__  .____    .__  "
echo " |    |/ _|____  |  | |__| |    |   |__| ____  __ _____  ___ "
echo " |      < \__  \ |  | |  | |    |   |  |/    \|  |  \  \/  / "
echo " |    |  \ / __ \|  |_|  | |    |___|  |   |  \  |  />    <  "
echo " |____|__ (____  /____/__| |_______ \__|___|  /____//__/\_ \ "
echo "         \/    \/                  \/       \/            \/ "
echo -e "${NC}"
echo -e "${BLUE} Update, Upgrade, GUI Mode & Hacking Tool by ${GREEN}Mr. SAGE${NC}"
echo ""
echo "--------------------------------------------------------------"
echo ""
echo -e "${CYAN}[>] Press ENTER to Install, CTRL+C to Abort.${NC}"
read INPUT
echo ""
# Update & Upgrade
echo -e "\e[92m[+]\e[96m Updating & Upgrading Kali Linux\e[0m"
sudo apt-get update
sudo apt-get -y upgrade
#sudo apt-get update --fix-missing
#sudo apt-get install kali-linux-full -y 
sudo apt-get --yes --force-yes install locales-all mlocate sudo
sudo rm -rf /root/.bash_history
sudo apt-get clean
sudo apt-get autoremove
echo -e "${RED}System Updated !!!.${NC}"
echo ""
# Installing XFCE4
echo ""
echo -e "\e[92m[+]\e[96m Installing XFCE4, this will take a while\e[0m"
sudo apt install -y kali-desktop-xfce xorg xrdp compton
echo -e "\e[92m[+]\e[96m Configuring XRDP to listen on port 3390 (but not starting the service)...\e[0m"
sudo sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini
echo -e "\e[92m[+]\e[96m Adding some settings to ~./bashrc\e[0m"
echo '## enable xcfe launch in WSL
export DISPLAY=:0
export XDG_RUNTIME_DIR=~/runtime
export RUNLEVEL=3
LANG="en_US.utf8"' >> ~/.bashrc
export DISPLAY=:0
sudo echo '## enable xcfe launch in WSL
export DISPLAY=:0
export XDG_RUNTIME_DIR=~/runtime
export RUNLEVEL=3
LANG="en_US.utf8"' >> /root/.bashrc
echo -e "\e[92m[+]\e[96m Getting some more scripts\e[0m"
wget --no-hsts -O ~/startx https://raw.githubusercontent.com/thehackingsage/Kali-WSL/master/startx
wget --no-hsts -O ~/.xinitrc https://raw.githubusercontent.com/thehackingsage/Kali-WSL/master/.xinitrc
chmod +x ~/startx ~/.xinitrc
ln -s ~/.xinitrc ~/.xsession
sudo cp ~/.xinitrc startx /root/
sudo chown root:root /root/.xinitrc /root/startx
sudo chmod 755 /root/.xinitrc /root/startx
sudo ln -s /root/.xinitrc /root/.xsession
sudo cp /root/startx /usr/local/bin/
echo -e "\e[92m[+]\e[96m Changing default panel settings for xfce\e[0m"
sudo wget --no-hsts -O /etc/xdg/xfce4/panel/default.xml https://raw.githubusercontent.com/thehackingsage/Kali-WSL/master/default.xml
sudo wget --no-hsts -O /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml https://raw.githubusercontent.com/thehackingsage/Kali-WSL/master/xfce4-session.xml
sudo mkdir /etc/xdg/disabled-autostart
sudo mv /etc/xdg/autostart/nm-applet.desktop /etc/xdg/autostart/disabled-autostart/
echo
echo -e "${RED}XFCE4 Successfully Installed !!!.${NC}"
echo ""
# Hacking Tool
echo ""
echo -e "\e[92m[+]\e[96m Installing Hacktronian..[0m"
wget https://raw.githubusercontent.com/thehackingsage/hacktronian/master/install.sh
sudo bash ./install.sh
echo -e "${RED}Hacktronian Successfully Installed !!!.${NC}"
clear
echo -e "\e[92m[*]\e[96m Installation Complete, \e[92mOnly One More Thing To Do..\e[0m"
echo
echo -e "\e[92m[*]\e[96m Please Download and Install VcXsrv X Server From Here:\e[0m"
echo
echo "    https://sourceforge.net/projects/vcxsrv/files/vcxsrv/1.19.6.0/"
echo
echo -e "\e[92m[>]\e[96m then Start VcXsrv, Accept Change in Firewall Rules, Exit VcXsrv\e[0m"
echo
echo -e "\e[92m[>]\e[96m After That Start Kali Linux in Windows.\e[0m"
echo
echo -e "\e[92m[*]\e[96m You Can Start GUI Mode via :\e[0m startx"
echo
echo -e "\e[92m[*]\e[96m You Can Start Hacktronian via :\e[0m hacktronian"
echo
echo -e "\e[92m[*]\e[96m Don't Forget To Follow Me on :\e[0m"
echo
echo "    GitHub     :  https://gitHub.com/thehackingsage"
echo "    Twitter    :  https://twitter.com/thehackingsage"
echo "    Instagram  :  https://instagram.com/thehackingsage"
echo ""
