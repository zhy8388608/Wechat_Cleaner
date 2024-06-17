#start
echo "******by zhy******"

#users
for user in $(ls /data/user)
do
	if [ ! -d /storage/emulated/$user/tencent ]
	then
		continue
	fi

#clean
rm -rf /storage/emulated/$user/tencent

#users
done

#finish
echo "******************"
