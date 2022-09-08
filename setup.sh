#/bin/bash

echo "installing required packages"


yum -y update; yum clean all
yum install -y yum install \
	glibc-static \
	wget \
	unzip \
	openssh-server \
	passwd \
	vim \
	sudo \
    vixie-cron &&\
    yum clean all &&\
	rm -rf /var/cache/yum

cat <<EOF >> /etc/sudoers
#usuari oracle 
oracle	ALL=(ALL)	NOPASSWD: ALL
EOF

# Comentem la linia per permetre el login per ssh
sed -e  '/memlock/ s/^#*/#/ ' -i /etc/security/limits.d/oracle-database-preinstall-21c.conf 

#Update enviroment variables
cat <<EOF >> /home/oracle/.bash_profile
export HOSTNAME=oracle
export ORACLE_BASE_HOME=/opt/oracle/homes/OraDB21Home1
export INSTALL_DIR=/opt/install
export ARCHIVELOG_DIR_NAME=archive_logs
export CHECKPOINT_FILE_EXTN=.created
export LD_LIBRARY_PATH=/opt/oracle/product/21c/dbhome_1/lib:/usr/lib
export RELINK_BINARY_FILE=relinkOracleBinary.sh
export ORACLE_SID=ORCLCDB
export SETUP_LINUX_FILE=setupLinuxEnv.sh
export CHECK_DB_FILE=checkDBStatus.sh
export CREATE_OBSERVER_FILE=createObserver.sh
export ORACLE_BASE=/opt/oracle
export CHECK_SPACE_FILE=checkSpace.sh
export ORACLE_PDB=ORCLCDB
export PATH=/opt/oracle/product/21c/dbhome_1/bin:/opt/oracle/product/21c/dbhome_1/OPatch/:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PWD=/home/oracle
export DG_OBSERVER_ONLY=false
export START_FILE=startDB.sh
export PWD_FILE=setPassword.sh
export SLIMMING=true
export RUN_FILE=runOracle.sh
export CREATE_DB_FILE=createDB.sh
export CLASSPATH=/opt/oracle/product/21c/dbhome_1/jlib:/opt/oracle/product/21c/dbhome_1/rdbms/jlib
export ORACLE_HOME=/opt/oracle/product/21c/dbhome_1
export INSTALL_DB_BINARIES_FILE=installDBBinaries.sh
PS1="\h$ "

EOF
