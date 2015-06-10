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
echo mkdir $HADOOP_DIR/logs/
mkdir $HADOOP_DIR/logs/

echo chmod 777 $HADOOP_DIR/logs/
chmod 777 $HADOOP_DIR/logs/

# create format hdfs file system 
echo su $HDFS_USER -c \'"/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/bin/hdfs namenode -format"\'
su $HDFS_USER -c \'"/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/bin/hdfs namenode -format"\'

# namenode
echo su -l $HDFS_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode"\'
su -l $HDFS_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode"\'

# secondary namenode
echo su -l $HDFS_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start secondarynamenode"\'
su -l $HDFS_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start secondarynamenode"\'

# datanode
echo su -l $HDFS_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode"\'
su -l $HDFS_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode"\'

# for yarn
echo su -l $HDFS_USER -c \'"$HDFS_DIR/bin/hdfs dfs -mkdir /mapred"\'
su -l $HDFS_USER -c \'"$HDFS_DIR/bin/hdfs dfs -mkdir /mapred"\'

echo su -l $HDFS_USER -c \'"$HDFS_DIR/bin/hdfs dfs -mkdir -p /user/sparks"\'
su -l $HDFS_USER -c \'"$HDFS_DIR/bin/hdfs dfs -mkdir -p /user/sparks"\'

echo su -l $HDFS_USER -c \'"$HDFS_DIR/bin/hdfs dfs -chown -R mapred /mapred"\'
su -l $HDFS_USER -c \'"$HDFS_DIR/bin/hdfs dfs -chown -R mapred /mapred"\'

echo su -l $YARN_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager"\'
su -l $YARN_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager"\'

echo su -l $YARN_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start nodemanager"\'
su -l $YARN_USER -c \'"$HADOOP_DIR/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start nodemanager"\'
