#/bin/bash

device=$1
DISK=$2

case $DISK in

         read.ops)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $4}'    #//磁盘读的次数
            ;;
         read.merged)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $5}'      #//合并读完成次数
            ;;
         read.sectors)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $6}'      #//读扇区的次数（一个扇区的等于512B）
            ;;
         read.ms)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $7}'    #//磁盘读的毫秒数
            ;;
         write.ops)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $8}'     #//磁盘写的次数
            ;;
         write.merged)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $9}'      #//合并写完成次数
            ;;           
         write.sectors)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $10}'     #//写扇区的次数（一个扇区的等于512B）
            ;;
         write.ms)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $11}'    #//磁盘写的毫秒数
            ;;
         io.active)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $12}'    #//I/O的当前进度，
            ;;
         io.ms)
            /bin/cat /proc/diskstats | grep "\b$device\b" | head -1 | awk '{print $13}'      #//花费在IO操作上的毫秒数
            ;;

esac
