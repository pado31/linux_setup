# Setup void linux with sway
#### Device: Thinkpad X1 Carbon Gen 6 (ch-fr keyboard customized as qwerty)

![alt text](https://github.com/pado31/linux_setup/blob/void_sway/img/ps_20221210200617.png?raw=true)

### Waring
Use it carefully - I am not responsible for your ricing ;)


### Guide
Run the script 
```
$ sh setup.sh
```

It will:
1. Update the system;
2. Install the packages;
3. Create working directories;
4. Configure the system and activate the services.

Notes about some packages:
- **sway** window manager;
- **waybar** status bar;
- **alsa** audio management (try `alsamixer`);
- **qrcp** file exchanger between terminal and smartphone through a QR code;
- **tlp** power management;
- **grim** for screenshots.


### P.S.
If unfortunately you use Windows, fortunately it has disappeared from void-grub, but you are really convinced that you want to use it, perform the following steps:

- Set GRUB_DISABLE_OS_PROBER=false in /etc/default/grub;
- ``` $ sudo update-grub ```


Wallpaper: Picture of <a href="https://unsplash.com/it/@kierancwhite?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Kieran White</a> from <a href="https://unsplash.com/it/foto/SBdmQcW8qag?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  
