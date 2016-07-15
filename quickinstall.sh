#
#Install and configure firewall
#
echo -e "\nInstalling and configuring firewall\n"
apt-get install ufw -y
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh

cat /etc/ufw/ufw.conf | sed 's/ENABLED=no/ENABLED=yes/g' > ~/ufw.conf
chmod 0644 ~/ufw.conf
mv -f ~/ufw.conf /etc/ufw/ufw.conf

#
# set timezone to Universal Coordinated Time
#
sudo timedatectl set-timezone UTC

#
# Upgrade installed packages to latest
#
apt-get update && apt-get dist-upgrade -y

#
#Install stuff I use all the time
#
apt-get install -y build-essential checkinstall docker.io fail2ban git git-core nmap python-dev python-numpy python-scipy python-setuptools unattended-upgrades htop 

#
#PCAP Everything
#
docker run -v ~/pcap:/pcap --net=host -d jgamblin/tcpdump
