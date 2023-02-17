#!/bin/bash

# Useage
# ./request.sh https://api.domain.com key=value

function request() {
  # -s 静默执行
  # -m 执行的最大时长(秒)
  # --connect-timeout 尝试连接的最大时长(秒)
  # -d 使用POST方式及参数
  # -o 屏蔽原输出（指定到空设备文件）
  # -w 自定义输出参数
  status=`curl -s -m 30 --connect-timeout 30 -d $2 -o /dev/null -w %{http_code} $1`
  path="/data/logs"
  time="$(date +"%Y-%m-%d %H:%M:%S")"
  date="$(date +"%Y-%m-%d")"

  if [ "$status" == "200" ]; then
    echo "[$time] <$1> request success." >> "$path/$date.log"
  else
    echo "[$time] <$1> request fail. Status = $status" >> "$path/$date.log"
  fi
}

request $1 $2