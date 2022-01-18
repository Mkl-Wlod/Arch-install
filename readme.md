# Arch Linux installation script

Simple script to install arch linux on clean disk (this script can remove all partitions itself)

you can use it in archiso by download git and jq (if you want to check and later set your timezone automatically)

## Usage
```sh
pacman -Sy git jq
git clone https://github.com/Mkl-Wlod/Arch-install.git
cd Arch-install/ && ./archinstall
```

### Functionality
- hibernation
- swap file or partition if hibernation enabled
- ext4, btrf, xfs file systems
- systemd or efistub as bootloader (only UEFI setup, maybe add for BIOS option someday)
- lvm and cryptsetup (for now no other option as partitioning)
- install long term support kernel (LTS)
- create privileged users and passwords for them
- enable privileged users to use sudo without password
- enable multilib repository
- enable NetworkManager

### Protips
If you have any other device in same network and it has ssh you can easly connect your installation arch and use it on other device by changing password `paswswd` and checking ip `ip a` on instalation, then connect to this by ssh root@your.ip.address.here 

#### Issues
Only root partition is encrypted even swap partition is created

#### Plans
At the end there will be one script, that will manage existing partitions, maybe option to not use lvm and cryptsetup
install arch on external removable drive and bios

