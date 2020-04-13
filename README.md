## 利用7z破解加密的zip压缩文件
---

有的时候当我们遇到带密码的zip压缩文件时，或是忘记了曾经的密码了，这个时间就得破解，通常采用fcrackzip破解，但会遇到下述难点。

> fcrackzip 在使用-u参数时只能解密在linux或mac下的打包的zip加密文件，但不能解压windows系统下打包的密码.

在mac或linux系统下用unzip解压windows系统里加密的zip文件，一般会出现如下错误
1. unsupported compression method 99
2. need PK compat. v5.1 (can do v4.6)

**原因**

- windows系统编码与unix类系统不兼容，
- 加密算法不兼容，比如使用AES加密。

*所以如果想破解windows系统下打包的zip加密文件，就必须使用7z压缩包*

[参考magiclen.org](https://magiclen.org/linux-unzip/)

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
