#!/usr/bin/env bash 

#Light theme

#echo "applying theme"

#this is a link showing how to use it 

#please read it before using it

#this script was heavily assisted by zren u/Zren on reddit 
# his website has very good tutorials 
# this is not the final stage of this script i would evolve to a plasmoid 
#widget with a gui for switching theme, colour style, icon as none is currently avaiable with  all the above  in kde 

##BTW this is heavily commented to help you get the location of the files
#if you want to change anything to suit your needs.
#[*] this is the name of the setting being changed in the system settings
#[usr] the location of the user installed theme 
#[sys] the location of the sys installed theme  A.K.A default theme 
#you can get there using cd.


#this is sets global theme from the system settings
##[GLobal theme]
# use "lookandfeeltool --list" to show all available themes
# replace org.kde.breezedark.desktop with this name of the theme 
##[GLobal theme]
lookandfeeltool -a org.kde.breeze.desktop
###########################################

#this sets the plasma style and the widgets style 
##[Plasma Style]
#[usr] ~.local/share/plasma/desktoptheme
#[sys] /usr/share/plasma/desktoptheme 
#change breeze-dark with the name of the folder in any of the above location
##[Plasma Style]
kwriteconfig5  --file ~/.config/plasmarc  --group Theme --key name "breeze-light"
###########################################


##[Appication Style]
###########################################

##[Colour Scheme]
#colour scheme  changed using kwriteconfig5  to the config file by  the system setting 
#[sys]/usr/share/color-schemes/
#[usr] ~/.local/share/color-schemes/
###########################################



#plasma-changeicons is used to change the icons style if the icon does not change
#type "locate plasma-changeicon" in the terminal to find plasma-changeicon
# path location 
# if not avaible install mlocate with 
# pacman -S mlocate or sudo apt install mlocate or check mlocate in your distro pacakage manager
# if you get this error "locate: can not stat () `/var/lib/mlocate/mlocate.db': No such file or directory"
# run sudo ionice -c3 updatedb or sudo updatedb
# replace "/usr/lib/plasma-changeicons" with the given path above
##[Icons]
#[usr] ~/.local/share/icons/
#[sys] /usr/share/icons/ 
/usr/lib/plasma-changeicons We10X-blue


##[Latte-dock]
#sometimes latte does not update the theme well 
#when using some type of layout and needs to be restarted
# uncomment the command below 
#latte-dock --replace &

###########################################

##Cursors 
#[source files]
#~/.icons/
#/usr/share/icons/
##############################################
  #ttrying kapplymousetheme does not work at the moment
##########################################
#echo "theme has applied"

##wall paper
## this sends a dbus to all availabe virtual desktop and changes the wall paper
## to change replace 
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();                                                                                                                       
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                    "org.kde.image",
                                    "General");
        d.writeConfig("Image", "file:///home/da-viper/.local/share/wallpapers/Blur-Glassy-No\ Logo.jpg");
}'

## this little project of mine would probably be extended to a plasmoid widget
# as i currently use the configurable button to run the script with a goood gui 
# as currently working on the gui as i know a little qml and c++ 
