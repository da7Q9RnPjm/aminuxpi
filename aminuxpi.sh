#!/bin/bash
# Based on Ubuntu
# Authomatic Package Installer for Aminux OS
# Coded by @unix666

i () {
   clear
   sudo apt install -y -qq $1
}
u () {
   sudo apt -qq -y update && sudo apt -qq -y upgrade
}
clear

# Show copyright
echo "

 █████╗ ███╗   ███╗██╗███╗   ██╗██╗   ██╗██╗  ██╗
██╔══██╗████╗ ████║██║████╗  ██║██║   ██║╚██╗██╔╝
███████║██╔████╔██║██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║ ██╔██╗ 
██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝██╔╝ ██╗
╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝

Authomatic Package Installer
Coded by : unix666 (t.me/unix666)
"
                                                 
# Available package
echo "NOTICE:"
echo "During installation you will be asked to type your password and"
echo "confirm some license agrements for proprietary drivers and tools"
echo "First, you need to select what extra packages you want to install:"
echo ""
echo "Atom Editor? Y/n"
read atom
echo "Arduino IDE? Y/n"
read arduino
echo "Spotify? Y/n"
read spotify
echo "Sound and video? Y/n"
read ljudvideo
echo "Graphics and photo? Y/n"
read grafikfoto
echo "GIS, Python and stuff...? Y/n"
read gisochsant
echo "Games on Steam? Y/n"
read spel
echo "Dropbox and office extras? Y/n"
read dropboxkontor
echo "Play on Linux - for: SketchUp, AirPort Tool, etc Y/n"
read playonlinux
echo "Laptop tools? Y/n"
read laptop
echo "MATE Software Botique? Y/n"
read mate
echo "Internet options (like Chromium)? Y/n"
read internet
echo "Software Defined Radio? Y/n"
read sdr

if [ "$atom" != "n" ]
then
wget https://atom-installer.github.com/v1.25.0/atom-amd64.deb
sudo dpkg -i atom-amd64.deb
fi

if [ "$arduino" != "n" ]
then
wget "https://downloads.arduino.cc/arduino-1.8.5-linux64.tar.xz"
sudo tar -xvf arduino-1.8.5-linux64.tar.xz
sudo bash arduino-1.8.5-linux64.tar.xz/install.sh
fi

if [ "$spotify" != "n" ]
then
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
u
i spotify-client
fi

if [ "$ljudvideo" != "n" ]
then
i breeze-icon-theme
i obs-studio
i kdenlive
i kazam
i vlc
i audacity
i kodi
i guvcview
i enblend
i handbrake
i pavucontrol
i libdvd-pkgppa:papirus/papirus
i libaacs0
i libbluray-bdj
i libbluray2
mkdir -p ~/.config/aacs/
cd ~/.config/aacs/ && wget http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
cd ~
sudo add-apt-repository -y ppa:heyarje/makemkv-beta
sudo apt-get purge -yyqq gstreamer1.0-fluendo-mp3
u
i makemkv-bin 
i makemkv-oss
fi

if [ "$grafikfoto" != "n" ]
then
sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release
sudo add-apt-repository -y ppa:nomacs/stable
sudo add-apt-repository -y ppa:kritalime/ppa
sudo add-apt-repository -y ppa:inkscape.dev/stable
u
i gimp
i darktable
i inkscape
i synfigstudio
i blender
i hugin
i krita
i karbon
i nomacs
fi

if [ "$gisochsant" != "n" ]
then
dist=$(lsb_release -c | cut -d':' -f 2 | xargs echo -n)
if [ "$dist" == "xenial" ]
then
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 089EBE08314DF160
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key CAEB3DC3BDF7FB45
echo deb http://qgis.org/ubuntugis xenial main | sudo tee /etc/apt/sources.list.d/qgis.list
echo deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main | sudo tee -a /etc/apt/sources.list.d/qgis.list
else
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key CAEB3DC3BDF7FB45
echo deb http://qgis.org/debian $dist main | sudo tee /etc/apt/sources.list.d/qgis.list
fi
u
i qgis 
i python-qgis 
i qgis-plugin-grass
i gpsbabel 
i mtkbabel 
i gpsd 
i gpsd-clients 
i gpsbabel-gui 
i meshlab 
i freecad 
i pgadmin3
i saga 
i python-saga 
i libotb 
i otb-bin 
i python-otb 
i python-exif 
i python-scipy 
i libwxgtk3.0-dev 
i libgdal-dev
i pyqt4-dev-tools 
i python-sphinx 
i bluefish 
i git 
i python-pip
sudo pip install jupyter bokeh pandas
fi

if [ "$spel" != "n" ]
then
i steam
i oracle-java8-installer
i binfmt-support
fi

if [ "$playonlinux" != "n" ]
then
i playonlinux
fi

if [ "$dropboxkontor" != "n" ]
then
wget "https://github.com/Automattic/simplenote-electron/releases/download/v1.1.3/Simplenote-linux-1.1.3.deb"
sudo dpkg -i Simplenote-linux-1.1.3.deb
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
i virtualbox
wget "http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb"
echo deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe | sudo tee /etc/apt/sources.list.d/temp.list
u
i libpng12
u
sudo dpkg -i wps-office_10.1.0.5707~a21_amd64.deb
wget https://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer_i386.deb
i nautilus
i calligraplan
i calligraflow
fi

if [ "$laptop" != "n" ]
then
i powertop
i laptop-mode-tools
sudo powertop --auto-tune --html
firefox powertop.html &
sudo update-rc.d laptop-mode defaults
i pulseaudio-module-bluetooth
pactl load-module module-bluetooth-discover #should run on every startup
fi

if [ "$mate" != "n" ]
then
i ubuntu-mate-welcome
fi

if [ "$internet" != "n" ]
then
i chromium-browser
i transmission
fi

if [ "$sdr" != "n" ]
then
i cmake
i libusb-1.0-0-dev
git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
echo "blacklist dvb_usb_rtl28xxu" | sudo tee /etc/modprobe.d/blacklist-rtl.conf
sudo add-apt-repository -y ppa:bladerf/bladerf
sudo add-apt-repository -y ppa:ettusresearch/uhd
sudo add-apt-repository -y ppa:myriadrf/drivers
sudo add-apt-repository -y ppa:myriadrf/gnuradio
sudo add-apt-repository -y ppa:gqrx/gqrx-sdr
u
i gqrx-sdr
volk_profile
fi

i gufw

sudo apt -f install -y -qq && sudo apt dist-upgrade -y -qq
clear
echo "Installation is done!" > postinstall.txt
echo "To do (suggestions):" >> postinstall.txt
echo "1. Add Lightning calender to Thunderbird" >> postinstall.txt
echo "   Add Provider for Google Calendar if you have a Google account" >> postinstall.txt
echo "2. Configure the Dock, add and remove launcers - if installed" >> postinstall.txt
echo "3. Fix sound with pavucontol - if needed" >> postinstall.txt
echo "4. Check for more drivers (try MATE Welcome if installed)" >> postinstall.txt
echo "5. Configure Dropbox - if installed" >> postinstall.txt
echo "6. If you installed PlayOnLinux start it to add PC software" >> postinstall.txt
echo "7. Add even more software from Software Botique - if installed" >> postinstall.txt
echo "8. Create your own shortcuts with alacarte" >> postinstall.txt
echo "9. Configure the whisker menu" >> postinstall.txt
echo "10.Change theme, icons, wallpaper etc to your hearts content" >> postinstall.txt
echo "11.If you installed SublimeText you might also want Emmet?" >> postinstall.txt
echo "    a. shift+ctrl+P search for Install Package Control" >> postinstall.txt
echo "    b. Package Control: Install Package..." >> postinstall.txt
echo "    c. Emmet" >> postinstall.txt
echo "12.If you installed Games, you might want to look at Software Boutique" >> postinstall.txt
echo "   for more games, like Minecraft." >> postinstall.txt
echo "" >> postinstall.txt
echo "Some installed software is not configured and may not start as it should" >> postinstall.txt
echo "automatically. Just add any program you want" >> postinstall.txt
echo "started to the list of autostarting programs." >> postinstall.txt
echo "And you should probably restart the computer to be on the safe side" >> postinstall.txt
echo "This text is saved in your HOME folder" >> postinstall.txt
echo "" >> postinstall.txt
echo "Screen tearing? Nvidia?" >> postinstall.txt
echo "Try: nvidia-settings --assign CurrentMetaMode=\"nvidia-auto-select +0+0 { ForceCompositionPipeline = On }\"" >> postinstall.txt
echo "Add the command to .profile to run on every login."
echo "On a Laptop and having Blutooth issues?" >> postinstall.txt
echo "Add \"pactl load-module module-bluetooth-discover\" to your startup." >> postinstall.txt
echo "" >> postinstall.txt
echo "If you run into problem, just Goole it!" >> postinstall.txt
alacarte &
thunderbird &
software-properties-gtk --open-tab=4 &
mousepad postinstall.txt &

if [ "$dropboxkontor" != "n" ]
then
~/.dropbox-dist/dropboxd &
fi

if [ "$playonlinux" != "n" ]
then
playonlinux &
fi

clear
cowsay -f tux "Everything finished! Now you can close this window. Don't forget to support Open Source."