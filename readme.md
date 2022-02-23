# Arch Linux installation script

Simple script to install arch linux on clean disk (this script can remove all partitions itself)

You can use it in archiso by download git and jq (if you want to find your timezone automatically during installation)

## Usage
```sh
pacman -Sy git jq
git clone https://github.com/Mkl-Wlod/Arch-install.git
cd Arch-install/ && ./archinstall
```

### Functionality
- Hibernation
- Swap file or partition if hibernation enabled
- Ext4, btrf, xfs file systems
- Systemd or efistub as bootloader (only UEFI setup, maybe add for BIOS option someday)
- Lvm and cryptsetup (for now no other option as partitioning)
- Install long term support kernel (LTS)
- Create privileged users and passwords for them
- Enable privileged users to use sudo without password
- Enable multilib repository
- Enable NetworkManager

### Protips
If you have any other device in same network and it has ssh you can easly connect your installation arch and use it on other device by changing password `paswswd` and checking ip `ip a` on instalation, then connect to this by ssh root@your.ip.address.here 

#### Issues
- Only root partition is encrypted even when swap partition is created
- Install yay (AUR package manager) not working yet

#### Plans
At the end there will be one script, that will manage existing partitions, maybe option to not use lvm and cryptsetup
install arch on external removable drive and bios

