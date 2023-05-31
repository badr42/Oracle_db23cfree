#!/bin/bash
export DB_PASSWORD=$1

echo "***Installing Dependencies***" 

sudo -s
dnf install -y oraclelinux-developer-release-el8

dnf config-manager --set-enabled ol8_developer 
dnf -y install oracle-database-preinstall-23c

echo "***Downloading DB RPM***" 

wget https://download.oracle.com/otn-pub/otn_software/db-free/oracle-database-free-23c-1.0-1.el8.x86_64.rpm



echo "***Installing DB 23c free***" 

dnf -y localinstall oracle-database-free-23c-1.0-1.el8.x86_64.rpm


#Configure the Database
echo "***Configuring DB***" 

export DB_PASSWORD=Tiger$tr0ng2023
(echo "${DB_PASSWORD}"; echo "${DB_PASSWORD}";) | /etc/init.d/oracle-free-23c configure



echo "***Testing Connection***" 
###connect 
sudo su - oracle 

#set the variables 
export ORACLE_SID=FREE 
export ORAENV_ASK=NO 
. /opt/oracle/product/23c/dbhomeFree/bin/oraenv
#ORACLE_HOME = [] ? /opt/oracle/product/23c/dbhomeFree


#cd $ORACLE_HOME/bin
#lsnrctl status
#./sqlplus / as sysdba


#./sqlplus -S /nolog <<EOF
#set heading off
#set feedback off
#connect / as sysdba
#SELECT version FROM v\$instance;
#exit;
#EOF



