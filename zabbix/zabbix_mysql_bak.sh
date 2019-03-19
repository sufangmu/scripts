#!/bin/bash
user="zabbix"
psword="q1w2e3r4"
bakdir="/backup"
Date=$(date +%F)
#删除3天之前的备份
find $bakdir -ctime 3  -name \*.sql -exec rm  -rf {} \;
#备份数据库
mysqldump -u${user} -p${psword} --databases zabbix > $bakdir/zabbix-${Date}.sql

