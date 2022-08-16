#!/bin/sh

links="http://ip-api.com/json/, https://freegeoip.app/json/, http://worldtimeapi.org/api/ip/"

timezone=$(curl http://ip-api.com/json/ | jq .timezone | sed "s/\"//g")

while true;do
printf 'locale setup\nyour possible timezone is "%s", want to use this timezone? [y/n/later]: ' "$timezone"
read answer
case "$answer" in
	[yY]* ) arch-chroot /mnt timedatectl set-timezone "$timezone" && echo "timezone set to $timezone" && break ;;
	[lL]ater ) break ;;
	*)
	zone_list_full=$(timedatectl list-timezones)
	zone_list=$(timedatectl list-timezones | awk -F / '{ print $1 }' | uniq | tr '\r\n' '\t')
	printf '%s\nChoose timezone: ' "$zone_list"
	read zone
	if [ -n "$zone" ];then
		requested_zone=$(timedatectl list-timezones | grep "$zone" | tr '\r\n' '\t')
		printf '%s\nChoose timezone for "%s": ' "$requested_zone" "$zone"
		read new_zone
		requested_zone_output=$(timedatectl list-timezones | awk -F / '{ print $1 }' | grep "$zone" | tr '\r\n' '\t\n')
		exist_zone=$(echo "$zone_list_full" | grep -o "$new_zone")
		[ -z "$(echo $new_zone | awk '/\//')" ] && new_zone="$zone/$new_zone"
		[ -z "$exist_zone" ] && continue
		arch-chroot /mnt timedatectl set-timezone "$new_zone"
		[ "$?" -eq "0" ] && echo "timezone set to $new_zone" && break
	else
		continue
	fi
;;
esac
done
