#!/bin/sh

printf "\e[1m\tUsers\e[0m\n"
while true;do
    printf "Create password for root\n"
    arch-chroot /mnt passwd root
  if [ "$?" != "0" ];then 
    continue
  else
    break
  fi
done

printf 'Create privileged users\n'
while true;do
  printf '\nType username you want to add or type exit\nusername: '
  read name
  existing_users=$(awk -F : '/'"$name"'/ {print $1}' /mnt/etc/passwd)
  if [ "$name" = "exit" ];then
    break
  else
    [ "$name" = "$existing_users" ] && printf 'user \e[1m%s\e[0m existing, user not created' "$name" && continue
  fi
  printf "you want to use name %s? [y/n]: " $name
  read answer
  case "$answer" in
    [Yy]* ) arch-chroot /mnt useradd -m -G wheel $name 
      while true;do
          printf 'Create password for %s\n' "$name"
          arch-chroot /mnt passwd "$name"
        if [ "$?" != "0" ];then
          continue
        else
          break
        fi
      done
      ;;
    [Nn]* ) printf 'user %s not created \n\n' $name ;;
      *) break ;;
  esac
done

printf 'Allow privileged users to excute commands without password [y/n]: '
read answer
case "$answer" in
  [Yy]* ) sed -i '/NOPASSWD/s/^# //g' /mnt/etc/sudoers ;;
  * ) sed -i '0,/%wheel/s/^# //g' /mnt/etc/sudoers ;;
esac
echo "succeed"

