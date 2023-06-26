echo "===Hello!! welcome to xueya proxy system!!!!!!!!"

echo "===This shell script written by xueya, used to open a socks5 proxy under linux"

echo "===Current time: $(date)"

pid=$(netstat -anp|grep 6789|awk '{printf $7}'|cut -d/ -f1)

if [ $1 -eq 1 ];
then
	#ssh -fqCND localhost:6789 your_hostname@your_ip

	#pid=$(netstat -anp|grep 6789|awk '{printf $7}'|cut -d/ -f1) 

	echo $pid

	if [ ! -n "$pid" ];
	then 
		echo "Port not open!!!"
		echo "String...proxy"

		ssh -fqCND localhost:6789 your_hostname@your_ip
			
		#echo $SHELL
		if [ $? -eq 0 ];
		then 
			echo "proxy open success!!!"
		else
			echo "proxy open error!!!"
		fi

	else
		echo "the proxy system is already started!!"
	fi

	export ALL_PROXY="socks5://127.0.0.1:6789"

	if [ $? -eq 0 ]
	then
		echo "the export is success to start!!!"
	else
		echo "export error!!!"
	fi

elif [ $1 -eq 0 ];
then
	unset ALL_PROXY

	if [ ! -n "$pid" ];
	then
		echo "the proxy system is closed!!!"
	else
		kill -15 $pid
		if [ $? -eq 0 ];
		then
			echo "the proxy system is success to close!!!"
		else
			echo "the error , undo kill pid(pid=$pid)"
		fi
	fi	
else
	echo "Waring:Unknow $1!!! please input 1 or 0\n 1 is start the proxy_System And 0 is stop the proxy_system"
fi
