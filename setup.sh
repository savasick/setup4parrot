#!/bin/bash


dir_name="Tools"
if [ ! -d "$dir_name" ]; then
  mkdir -p "$dir_name"
  if [ $? -ne 0 ]; then
    echo "Failed to create directory $dir_name"
    exit 1
  fi
fi

cd "$dir_name"


echo "Do you want to download the password manager?"
read -p "KeePassXC (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading KeePassXC"
  mkdir keepassxc
  cd keepassxc
  wget https://github.com/keepassxreboot/keepassxc/releases/download/2.7.6/KeePassXC-2.7.6-x86_64.AppImage
  wget https://github.com/keepassxreboot/keepassxc/releases/download/2.7.6/KeePassXC-2.7.6-x86_64.AppImage.sig
  wget https://github.com/keepassxreboot/keepassxc/releases/download/2.7.6/KeePassXC-2.7.6-x86_64.AppImage.DIGEST
  gpg --keyserver keys.openpgp.org --recv-keys BF5A669F2272CF4324C1FDA8CFB4C2166397D0D2
  gpg --verify KeePassXC-*.sig
  shasum -a 256 -c KeePassXC-*.DIGEST
  chmod 744 KeePassXC-2.7.6-x86_64.AppImage
  cd ..
else
  echo "Download KeePassXC skiped"
fi
echo ""


read -p "Do you want to download the VirtualBox? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading VirtualBox"
  sudo apt install virtualbox -y
else
  echo "Download VirtualBox skiped"
fi
echo ""

read -p "Do you want to download the Telegram-desktop? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading Telegram-desktop"
  sudo apt install telegram-desktop -y
else
  echo "Download Telegram-desktop skiped"
fi
echo ""

read -p "Do you want to download the TOR / TOR tools? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading TOR / TOR tools"
  sudo apt install tor torsocks obfs4proxy torbrowser-launcher -y
else
  echo "Download TOR / TOR tools skiped"
fi
echo ""

read -p "Do you want to download the Discord? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading Discord"
  wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
  sudo dpkg -i discord.deb
else
  echo "Download Discord skiped"
fi
echo ""


read -p "Do you want to configure keyboard for ru/en (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "keyboard changing sittings"
  sudo cp /etc/default/keyboard /etc/default/keyboard.bak
  sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="us,ru"/g' /etc/default/keyboard
  sudo sed -i 's/XKBOPTIONS=""/XKBOPTIONS="grp:alt_shift_toggle"/g' /etc/default/keyboard
else
  echo "configure keyboard skiped"
fi
echo ""

read -p "Do you want to download the Element-desktop for Matrix chats? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading Element-desktop"
  sudo apt install -y wget apt-transport-https
  sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
  sudo apt update -y
  sudo apt install element-desktop -y
else
  echo "Download Element-desktop skiped"
fi
echo ""

read -p "Do you want to download the Brave browser? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading Brave browser"
  sudo apt install curl
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update -y
  sudo apt install brave-browser -y
  echo "brave installed"
else
  echo "Download Brave browser skiped"
fi
echo ""


read -p "Do you want to download the ClamAV antivirus software? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Downloading ClamAV antivirus"
  sudo apt install clamav clamav-daemon -y
  sudo freshclam
else
  echo "Download ClamAV antivirus skiped"
fi
echo ""

echo "SETUP DONE"


read -p "Do you want to open links for virtual machine? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  xdg-open https://start.parrotsec.org/download/
  xdg-open https://www.kali.org/get-kali/#kali-virtual-machines
  xdg-open https://www.whonix.org/wiki/VirtualBox
  xdg-open https://www.pfsense.org/download/
else
  echo "links skiped"
fi
echo ""

cd ..
mv "$dir_name" $HOME