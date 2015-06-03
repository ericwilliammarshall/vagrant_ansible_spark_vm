#! /bin/bash
source /etc/profile.d/java.sh

# for hdfs
HDFS_USER='hdfs'
YARN_USER='yarn'
MAPRED_USER='mapred'
HADOOP_CONF_DIR='/etc/hadoop/conf/'
HDP='/usr/hdp/current'
HDFS_DIR='/usr/hdp/2.2.4.2-2/hadoop-hdfs'
YARN_DIR='/usr/hdp/2.2.4.2-2/hadoop-yarn'
HADOOP_DIR='/usr/hdp/2.2.4.2-2/hadoop'

# Allow everyone to write to logs
mkdir $HADOOP_DIR/logs/
chmod 777 $HADOOP_DIR/logs/
# namenode
su $HDFS_USER -c "$HDFS_DIR/bin/hdfs namenode -format"
su $HDFS_USER -c "$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode"

# secondary namenode
su $HDFS_USER -c "$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start secondarynamenode"

# datanode
su $HDFS_USER -c "$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode"

# for yarn
su $HDFS_USER -c "$HDFS_DIR/bin/hdfs dfs -mkdir /mapred"
su $HDFS_USER -c "$HDFS_DIR/bin/hdfs dfs -chown -R mapred /mapred"

su $YARN_USER -c "$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager"
su $YARN_USER -c "$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start nodemanager"

