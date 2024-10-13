#define color names
green="\033[32m"
red="\033[31m"
yellow="\033[33m"
reset="\033[0m"

#install sury packages
echo -e "${yellow}Aktualisieren der Paketquellen$...{reset}"
apt update > /dev/null 2>&1 &
wait
echo -e "${green}Aktualisierung abgeschlossen.${reset}"
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt update

#install apache2
echo -e "${yellow}Installieren von apache2...${reset}"
echo "einen moment bitte"
apt install apache2 > /dev/null 2>&1 &
wait
echo -e "${yellow}Installation abgeschlossen.${reset}"

#Install PHP
echo -e "${yellow}Installieren von php8.2 und den Modulen json, mysqlnd, curl, dom, hash, mbstring, xml, zip, memcached, image, sockets...${reset}"

apt install php8.2 php8.2-cli php8.2-mysqlnd php8.2-curl php8.2-dom php8.2-mbstring php8.2-xml php8.2-zip php8.2-memcached php8.2-sockets > /dev/null 2>&1 &
wait

echo -e "${green}Installation abgeschlossen.${reset}"

#delete script

echo -e "${yellow}Das Skript wird entfernt...${reset}
rm apache_php_deb.sh
wait
echo -e "${green}Das Skript wurde erfolgreich entfernt${reset}
