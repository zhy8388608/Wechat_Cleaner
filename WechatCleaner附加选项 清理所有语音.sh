#start
echo "******by zhy******"

#kill
pkill com.tencent.mm

#users
for user in $(ls /data/user)
do

#data
mm=/data/user/$user/com.tencent.mm
if [ -d $mm/MicroMsg ]
then
	rm -rf $mm/MicroMsg/ee1da3ae2100e09165c2e52382cfe79f
	for target in $(ls $mm/MicroMsg)
	do
		if [ ${#target} == 32 -a -d $mm/MicroMsg/$target ]
		then
			rm -rf $mm/MicroMsg/$target/account.bin
		fi
	done
fi

#sdcard/android/data
mm=/storage/emulated/$user/Android/data/com.tencent.mm
if [ -d $mm/MicroMsg ]
then
	for target in $(ls $mm/MicroMsg)
	do
		if [ ${#target} == 32 -a -d $mm/MicroMsg/$target ]
		then
			rm -rf $mm/MicroMsg/$target/voice2
		fi
	done
fi

#users
done

#finish
echo "******请重启微信******"
