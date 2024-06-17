#start
echo "******by zhy******"

#stop
am force-stop 'com.tencent.mm'

#users
for user in $(ls /data/user)
do

#data
mm=/data/user/$user/com.tencent.mm
if [ -d $mm/MicroMsg ]
then
	rm -rf $mm/!(.auth_cache|MicroMsg|shared_prefs|databases|files) #本地配置文件|聊天文件|数据文件|主要文件
	rm -rf $mm/shared_prefs/!(com.tencent.mm_preferences_account_switch.xml|com.tencent.mm_preferences.xml) #账号切换信息|微信设置
	rm -rf $mm/databases/!(FKZ_WX_DATA) #微X模块设置
	rm -rf $mm/files/!(host) #host文件
	rm -rf $mm/files/host/!(host-redirect.xml) #重定向host文件
	rm -rf $mm/MicroMsg/ee1da3ae2100e09165c2e52382cfe79f
	for target in $(ls $mm/MicroMsg)
	do
		if [ ${#target} == 32 -a -d $mm/MicroMsg/$target ]
		then
			rm -rf $mm/MicroMsg/$target/!(EnMicroMsg.db|attachment|image2|video|voice2|avatar|account.bin) #聊天记录|接收文件|聊天图片|聊天视频|聊天语音|联系人头像|聊天索引
		else
			if [ "$(echo $target | grep -E 'autoauth.cfg|systemInfo.cfg|CompatibleInfo.cfg|emoji|expansions')" == "" ] #配置信息|host信息|登录设备信息|表情包|play版小程序组件
			then
				rm -rf $mm/MicroMsg/$target
			fi
		fi
	done
fi

#sdcard/android/data
mm=/storage/emulated/$user/Android/data/com.tencent.mm
if [ -d $mm/MicroMsg ]
then
	rm -rf $mm/!(MicroMsg)
	for target in $(ls $mm/MicroMsg)
	do
		if [ ${#target} == 32 -a -d $mm/MicroMsg/$target ]
		then
			rm -rf $mm/MicroMsg/$target/!(attachment|video|voice2|package) #接收文件|旧版聊天视频|旧版聊天语音|聊天背景
		else
			rm -rf $mm/MicroMsg/$target
		fi
	done
fi

#sdcard/tencent/MicroMsg
sdcard=/storage/emulated/$user
mm=/storage/emulated/$user/tencent/MicroMsg
if [[ -d $mm && "$(ls $mm)" ]]
then
	if [[ -d $mm/WeiXin && "$(ls $mm/WeiXin)" ]]
	then
		mkdir -p $sdcard/Pictures/WeiXin
		mv $mm/WeiXin/* $sdcard/Pictures/WeiXin/ #旧版保存本地的图片
	fi
	for target in $(ls $mm)
	do
		if [ ${#target} == 32 -a -d $mm/$target ]
		then
			rm -rf $mm/$target/!(video|voice2) #旧版聊天视频|旧版聊天语音
		else
			rm -rf $mm/$target
		fi
	done
fi

#users
done

#finish
echo "******请重启微信******"
