## 利用7z破解压缩文件
---
该程序主要是利用crunch 程序和crackzip.sh脚本来破解加密的zip文件， 程序可以在Linux或macos 中，本程序重点测试了macos

### 1.安装crunch

macos 命令 `$ brew install crunch` 
Linux  命令 `$ sudo yum install crunch`

### 2.生成字典

根据被破解文件的密码复杂度来生成密码字典，**原则** 是被破解密码的规则了解的越清楚越好。
如被破解zip的密码是4位小写和数字组合生成字典命令如下
`# crunch 4 4 abcdefghijklmnopqrstuvwxyz0123456789 -o pwd2.txt`

### 3.运行crackzip.sh 

在被破解的程序的目录运行如下

```shell
chmod +x crackzip
./crackzip xxxx.zip
```

### 4.等密码出现
如下述结果

```shell
bogon:crackzip lfp$ ./crackzip.sh xxx.zip 
Total times is : 3
password has been found : av72
```
