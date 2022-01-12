#!/bin/sh

printf "\e[1m\tLanguage Setup\e[0m
choose your language by typing shorted name (example: en pl fr)\nLanguage: "
read language
if [ "$language" = "en" ];then
    possibilities=$(awk '/#en/ {print $1}' /mnt/etc/locale.gen |\
    sed 's/\..*// ; s/^#//g' | awk '{ ORS=" "; print $1 "\t"}' | uniq)
        printf '%s\nchoose english variant: ' "$possibilities" 
    read lang_opt
    case "$lang_opt" in
      en_US) 
        sed -i '0,/en_US.UTF/d' /mnt/etc/locale.gen
        sed -i '/'"$lang_opt"'.UTF/s/^#//g' /mnt/etc/locale.gen
        arch-chroot /mnt locale-gen
    	echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf
        ;;
      *)  
        sed -i '/'"$lang_opt"'.UTF/s/^#//g' /mnt/etc/locale.gen
        arch-chroot /mnt locale-gen
    	echo "LANG=$lang_opt.UTF-8" > /mnt/etc/locale.conf
        ;;
    esac
  else
    sed -i '/'"$language.${language^^}"'.UTF/s/^#//g' /mnt/etc/locale.gen
    arch-chroot /mnt locale-gen
    echo "LANG=$language.${language^^}.UTF-8" > /mnt/etc/locale.conf
fi

