#!/bin/bash
# author: liufapeng
# date: 2020-4-12
# time: 23:05  
#
# Mac os 下破解zip压缩文件的密码有两种方案
# 第一种: 采用fcrackzip ，可用brew install fcrackzip 安装破解，具体使用可以参见man fcrackzip 
# 第二种: 可以用crunch 生成密码字典，然后利用下面的脚本进行破解 
#      1. crunch 4 4 abcdefghijklmnopqrstuvwxyz0123456789 -o pwd2.txt  #可以利用brew install crunch,生成不同位数的字典。
#      2. 执行下面程序即可。
# 
# 重点说明：fcrackzip 在使用-u 参数时只能解密在linux或mac下的打包的zip加密文件，但不解压windows系统下打包的密码，
# 原因是windows系统编码与unix类系统不兼容，所以如果想破解windows系统下打包的zip加密文件，就必须使用7z压缩包
# 
# 在mac或linux系统下用unzip解压windows系统里加密的zip文件，一般会出现如下错误
# 1. unsupported compression method 99
# 2. need PK compat. v5.1 (can do v4.6)
# 
# 参照https://magiclen.org/linux-unzip/说明

#初始化状态进入循环
EXIT_STATUS=2
TIMES=1

while read pwd_str
do
      7z x -y -p"$pwd_str" $1 >/dev/null 2>&1  #尝试用字典暴力破解
      
      EXIT_STATUS=$? 

      if [[ $EXIT_STATUS -eq 0 ]]
      then
         #echo $EXIT_STATUS
         echo "Total times is : $TIMES"
         echo "password has been found : $pwd_str"
         exit 0
      else
         let TIMES+=1
      fi

done<pwd2.txt
