#!/bin/bash
# Date  :2019-01-21
# Auth  :Gao Peng
# E-mail:gaopeng0214@126.com
# 公共函数部分

# 格式化颜色输出
function echo_black(){ echo -e "\033[30m$@\033[0m"; }
function echo_red(){ echo -e "\033[31m$@\033[0m"; } 
function echo_green(){ echo -e "\033[32m$@\033[0m"; }
function echo_yellow(){ echo -e "\033[33m$@\033[0m"; }
function echo_blue(){ echo -e "\033[34m$@\033[0m"; }
function echo_violet(){ echo -e "\033[35m$@\033[0m"; }
function echo_bluish(){ echo -e "\033[36m$@\033[0m"; }
function echo_white(){ echo -e "\033[37m$@\033[0m"; }

# 错误输出
err() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S %z')]  $0 ${FUNCNAME[1]}  line:$BASH_LINENO  messsage:$@" >&2
}

