#!/usr/bin/env bash

# This file is sourced when running various Spark programs.
# Copy it as spark-env.sh and edit that to configure Spark for your site.

# Options read when launching programs locally with 
# ./bin/run-example or ./bin/spark-submit
# - HADOOP_CONF_DIR, to point Spark towards Hadoop configuration files
export HADOOP_CONF_DIR=/etc/hadoop/conf
export PATH=/usr/local/scala/bin:/opt/spark/current/bin:/opt/spark/current/sbin:$PATH

# - SPARK_LOCAL_IP, to set the IP address Spark binds to on this node
# ==== CHANGE ON EACH HOST ====
export SPARK_LOCAL_IP=127.0.0.1
# - SPARK_PUBLIC_DNS, to set the public dns name of the driver program
# - SPARK_CLASSPATH, default classpath entries to append


# Options read by executors and drivers running inside the cluster
# - SPARK_LOCAL_IP, to set the IP address Spark binds to on this node
# - SPARK_PUBLIC_DNS, to set the public DNS name of the driver program
# - SPARK_CLASSPATH, default classpath entries to append
# - SPARK_LOCAL_DIRS, storage directories to use on this node for shuffle and RDD data
# - MESOS_NATIVE_LIBRARY, to point to your libmesos.so if you use Mesos

# Options read in YARN client mode
# - HADOOP_CONF_DIR, to point Spark towards Hadoop configuration files
export HADOOP_CONF_DIR=/etc/hadoop/conf
# - SPARK_EXECUTOR_INSTANCES, Number of workers to start (Default: 2)
export SPARK_EXECUTOR_INSTANCES=6
# - SPARK_EXECUTOR_CORES, Number of cores for the workers (Default: 1).
export SPARK_EXECUTOR_CORES=12
# - SPARK_EXECUTOR_MEMORY, Memory per Worker (e.g. 1000M, 2G) (Default: 1G)
export SPARK_EXECUTOR_MEMORY=2G
# - SPARK_DRIVER_MEMORY, Memory for Master (e.g. 1000M, 2G) (Default: 512 Mb)
export SPARK_DRIVER_MEMORY=1G
# - SPARK_YARN_APP_NAME, The name of your application (Default: Spark)
# - SPARK_YARN_QUEUE, The hadoop queue to use for allocation requests (Default: ‘default’)
# - SPARK_YARN_DIST_FILES, Comma separated list of files to be distributed with the job.
# - SPARK_YARN_DIST_ARCHIVES, Comma separated list of archives to be distributed with the job.

# Options for the daemons used in the standalone deploy mode
# - SPARK_MASTER_IP, to bind the master to a different IP address or hostname
export SPARK_MASTER_IP=127.0.0.1

# - SPARK_MASTER_PORT / SPARK_MASTER_WEBUI_PORT, to use non-default ports for the master
# - SPARK_MASTER_OPTS, to set config properties only for the master (e.g. "-Dx=y")
# - SPARK_WORKER_CORES, to set the number of cores to use on this machine
# - SPARK_WORKER_MEMORY, to set how much total memory workers have to give executors (e.g. 1000m, 2g)
# - SPARK_WORKER_PORT / SPARK_WORKER_WEBUI_PORT, to use non-default ports for the worker
# - SPARK_WORKER_INSTANCES, to set the number of worker processes per node
# - SPARK_WORKER_DIR, to set the working directory of worker processes
# - SPARK_WORKER_OPTS, to set config properties only for the worker (e.g. "-Dx=y")
# - SPARK_HISTORY_OPTS, to set config properties only for the history server (e.g. "-Dx=y")
# - SPARK_DAEMON_JAVA_OPTS, to set config properties for all daemons (e.g. "-Dx=y")
# - SPARK_PUBLIC_DNS, to set the public dns name of the master or workers

# Generic options for the daemons used in the standalone deploy mode
# - SPARK_CONF_DIR      Alternate conf dir. (Default: ${SPARK_HOME}/conf)
# - SPARK_LOG_DIR       Where log files are stored.  (Default: ${SPARK_HOME}/logs)
export SPARK_LOG_DIR=/var/log/spark
# - SPARK_PID_DIR       Where the pid file is stored. (Default: /tmp)
export SPARK_PID_DIR=/var/run/spark
# - SPARK_IDENT_STRING  A string representing this instance of spark. (Default: $USER)
# - SPARK_NICENESS      The scheduling priority for daemons. (Default: 0)`
export PATH=/usr/local/scala/bin:/usr/local/spark/bin:/usr/local/spark/sbin:/usr/local/sbt/bin:$PATH
export JAVA_LIBRARY_PATH=$JAVA_LIBRARY_PATH:/usr/hdp/2.2.4.2-2/hadoop/lib/native/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/hdp/2.2.4.2-2/hadoop/lib/native/
export SPARK_YARN_USER_ENV="JAVA_LIBRARY_PATH=$JAVA_LIBRARY_PATH,LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
if [ -d "/etc/tez/conf/" ]; then
	export TEZ_CONF_DIR=/etc/tez/conf
else
	export TEZ_CONF_DIR=
fi
