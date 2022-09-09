# oracle-ee-21c
Oracle Enterprese Edition 21c  

This docker add a layer with ssh server connection enabled on top of the Official Oracle images

## Instructions:
1. Follow the guidelines from this [repository](https://github.com/steveswinsburg/oracle21c-docker). You will create a local image with an Oracle 21c Single Instance ready to be used.

2. clone this repository and build the image:
```
cd docker-oracle-ee-21c
docker build --tag oriolrt/oracle-ee-21c .
```

## Quick Start

As described in [repository](https://github.com/steveswinsburg/oracle21c-docker), you can run the sensible defaults:
```
docker run \
--name oracle21c \
-p 1521:1521 \
-p 5500:5500 \
-p 2222:22 \
-e ORACLE_PDB=orcl \
-e ORACLE_PWD=oracle \
-e INIT_SGA_SIZE=3000 \
-e INIT_PGA_SIZE=1000 \
-v /opt/oracle/oradata \
-d \
oriolrt/oracle-ee-21c
```
It will take about 10-15 minutes to create and setup the database on the first run. If you want to mount the data folder on your file system. Make sure you set the -v command appropriately for your system.
```
docker run \
--name oracle21c \
-p 1521:1521 -p 5500:5500 \
-p 2222:22 \
-e ORACLE_PDB=orcl \
-e ORACLE_PWD=oracle \
-e INIT_SGA_SIZE=3000 \
-e INIT_PGA_SIZE=1000 \
-v /path/to/store/db/files/:/opt/oracle/oradata \
-d \
oriolrt/oracle-ee-21c
```


## How to connect

By default, the password verification is disable(password never expired)
Connect database with following setting:

hostname: localhost  
port: 2222  
service name: orcl  

username: system  
password: oracle  
Password for SYS & SYSTEM  

To connect by ssh, the user and pasword are both *oracle*:
```
ssh -p 2222 oracle@localhost
``` 

