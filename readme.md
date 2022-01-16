# Arch Linux installation script

For now two separate scripts, first is working with clean disk, better to clean disk earlier because kernel might not update partitions
Second script not much, but will work someday

you can use it in archiso by download git and jq (if you want to check your timezone automatically)

## Usage
```sh
pacman -Sy git jq
git clone https://github.com/Mkl-Wlod/Arch-install.git
cd Arch-install/ && ./archinstall
```

### Functionality
- At this time script can setup Arch Linux to use hibernation
- ext4, btrf, xfs file systems
- systemd or efistub as bootloader (only UEFI setup, maybe add for BIOS option someday)
- lvm and cryptsetup
- install long term support kernel (LTS)


#### Issues
there is too many issues for now, in first script biggest issues is try to install when other partitions exist and timezone creation

#### Plans
At the end there will be one script, that will manage existing partitions, maybe option to not use lvm and cryptsetup
install arch on external removable drive

