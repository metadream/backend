#!/bin/bash

TIME="$(date +"%Y%m%d_%H%M%S")"
LOG="/root/logs/backup-cos-$TIME.log"
TARGET_DIR="/mnt/nas/Bucket"

# 初始化配置
# coscmd config -a $SECRET_ID -s $SECRET_KEY -b $BUCKET -r $REGION

# 下载当前 bucket 根目录下所有文件
# -rs 跳过 md5 校验相同的文件
# --delete 删除云上删除但本地未删除的文件
coscmd -b xxxx-xxxxxxxx -r ap-guangzhou download -rs --delete / $TARGET_DIR/Data > /dev/null 2>>$LOG
