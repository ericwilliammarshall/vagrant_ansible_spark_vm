 /usr/hdp/2.2.4.2-2/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop/conf/ start namenode
 /usr/hdp/2.2.4.2-2/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop/conf/ start datanode
 /usr/hdp/2.2.4.2-2/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop/conf/ start secondarynamenode
 /usr/hdp/2.2.4.2-2/hadoop-yarn/sbin/yarn-daemon.sh --config /etc/hadoop/conf/ start resourcemanager
 /usr/hdp/2.2.4.2-2/hadoop-yarn/sbin/yarn-daemon.sh --config /etc/hadoop/conf/ start nodemanager
 /opt/spark/current/sbin/start-master.sh
