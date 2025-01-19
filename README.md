# uConsole

OS builder:

https://github.com/ak-rex/ClockworkPi-pi-gen

added xwayland



## Display Manager

https://git.sr.ht/~kennylevinsen/greetd



manually built

https://git.sr.ht/~kennylevinsen/gtkgreet





## Window Manager

install sway

https://swaywm.org



/etc/sway/config.d/uconsole.conf

```
output DSI-1 mode 720x1280@59.536Hz position 0,0 transform 90
```



/etc/sway/config

```
output DSI-1 mode 720x1280@59.536Hz position 0,0 transform 90

#
# Brightness
#
    bindsym XF86MonBrightnessUp exec brightnessctl s 1+
    bindsym XF86MonBrightnessDown exec brightnessctl s 1-
    
#
# Volume
#
    bindsym XF86AudioRaiseVolume exec amixer set 'PCM' 1000+
    bindsym XF86AudioLowerVolume exec amixer set 'PCM' 1000-    
    
    
```





https://catppuccin.com





## Launcher

install wofi

https://hg.sr.ht/~scoopta/wofi

Fuzzel

https://codeberg.org/dnkl/fuzzel



## Notifications

https://github.com/ErikReider/SwayNotificationCenter

libnotify-bin



## Network

Network Manager

https://github.com/firecat53/networkmanager-dmenu



nmtui



## USB

https://github.com/coldfix/udiskie?tab=readme-ov-file



## TopBar

Waybar

https://github.com/Alexays/Waybar



fonts-font-awesome





```
- Run 'sudo dpkg-reconfigure locales' and changing from en_GB.UTF-8 to en_US.UTF-8
(or whatever country setting you need).
- Run 'sudo dpkg-reconfigure keyboard-configuration' and change the keyboard to USA PC101
(again, change as needed).
- Reboot.
```

