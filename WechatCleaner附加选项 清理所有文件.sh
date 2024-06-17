#start
echo "******by zhy******"

#kill
pkill com.tencent.mm

#users
for user in $(ls /data/user)
do

#sdcard/android/data
mm=/storage/emulated/$user/Android/data/com.tencent.mm
if [ -d $mm/MicroMsg ]
then
	for target in $(ls $mm/MicroMsg)
	do
		if [ ${#target} == 32 -a -d $mm/MicroMsg/$target ]
		then
			rm -rf $mm/MicroMsg/$target/attachment
		fi
	done
fi

#users
done

#finish
echo "******请重启微信******"
