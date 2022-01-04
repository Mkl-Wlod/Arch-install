# Arch Linux installation script

## For now two separate scripts, first is working with clean disk, better to clean disk earlier because kernel might not update partition

### Functionality
- At this time script can setup Arch Linux to use hibernation
- ext4, btrf, xfs file systems
- systemd or efistub as bootloader (only UEFI setup)
- lvm and cryptsetup
- install long term support kernel (LTS)


#### Issues
there is too many issues for now, in first script biggest issues is try to install when other partitions exist and timezone creation

#### Plans
At the end there will be one script, that will manage existing partitions, maybe option to not use lvm and cryptsetup
install arch on external drive

