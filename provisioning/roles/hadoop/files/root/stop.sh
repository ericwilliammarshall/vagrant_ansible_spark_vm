 /usr/hdp/2.2.4.2-2/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop/conf/ stop namenode
 /usr/hdp/2.2.4.2-2/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop/conf/ stop datanode
 /usr/hdp/2.2.4.2-2/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop/conf/ stop secondarynamenode
 for proc in $(ps -ef | grep NodeManager | awk '{print $2}') ; do echo "stopping process $proc"; kill $proc ; done
 for proc in $(ps -ef | grep ResourceManager | awk '{print $2}') ; do echo "stopping process $proc"; kill $proc ; done
 for proc in $(ps -ef | grep -i spark | awk '{print $2}') ; do echo "stopping process $proc"; kill $proc ; done
