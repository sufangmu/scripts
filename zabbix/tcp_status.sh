#!/bin/bash
# zabbix agent count tcp connetion number
# date:2018/12/22
# auth gaopeng


# ESTABLISHED:The socket has an established connection.
# SYN_SENT:The socket is actively attempting to establish a connection.
# SYN_RECV: A connection request has been received from the network.
# FIN_WAIT1:The socket is closed, and the connection is shutting down.
# FIN_WAIT2:Connection is closed, and the socket is waiting for a shutdown from the remote end.
# TIME_WAIT:The socket is waiting after close to handle packets still in the network.
# CLOSE:The socket is not being used.
# CLOSE_WAIT:The remote end has shut down, waiting for the socket to close.
# LAST_ACK:The remote end has shut down, and the socket is closed. Waiting for acknowledgement.
# LISTEN:The  socket is listening for incoming connections.  Such sockets are not included in the 
#         output unless you specify the --listen‐ ing (-l) or --all (-a) option.
# CLOSING:Both sockets are shut down but we still don't have all our data sent.
# UNKNOWN:The state of the socket is unknown.


arg=$1
tmp_file=/tmp/TCPStatus.txt
/bin/netstat -an|grep "^tcp" |awk '{print $6}'|sort -ir|uniq -c  > $tmp_file
case  $arg in
    close)
        status=$(awk '/CLOSE$/ {print $1}' $tmp_file) && echo ${status:=0};;
    closewait)
        status=$(awk '/CLOSE_WAIT$/ {print $1}' $tmp_file) && echo ${status:=0};;    
    closing)
        status=$(awk '/CLOSING$/ {print $1}' $tmp_file) && echo ${status:=0};;              
    established)
        status=$(awk '/ESTABLISHED$/ {print $1}' $tmp_file) && echo ${status:=0};;
    listen)
        status=$(awk '/LISTEN$/ {print $1}' $tmp_file) && echo ${status:=0};;
    timewait)
        status=$(awk '/TIME_WAIT$/ {print $1}' $tmp_file) && echo ${status:=0};;
    lastack)
        status=$(awk '/LAST_ACK$/ {print $1}' $tmp_file) && echo ${status:=0};;
    synsent)
        status=$(awk '/SYN_SENT$/ {print $1}' $tmp_file) && echo ${status:=0};;
    synrecv)
        status=$(awk '/SYN_RECV$/ {print $1}' $tmp_file) && echo ${status:=0};;
    finwait1)
        status=$(awk '/FIN_WAIT1$/ {print $1}' $tmp_file) && echo ${status:=0};;
    finwait2)
        status=$(awk '/FIN_WAIT2$/ {print $1}' $tmp_file) && echo ${status:=0};;    
    *)
        echo 0;;   
esac