# LinuxProxyScript
此脚本适用于两个不同网段的服务器之间短时间的代理通信，若是对代理的可用性有要求或是长时间开代理，推荐安装autossh保证连接可靠。
若是运行此脚本，将脚本中的”your_hostname@your_ip”改为代理服务器信息。
谨慎使用sh或是./运行，可用source运行在当前shell，这样可用命令”curl ip111.cn” 检测是否代理成功
