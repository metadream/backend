#!/bin/bash

# export http_proxy=10.0.0.6:8889
# export https_proxy=10.0.0.6:8889

rclone sync <source> <target> --include /<dir1>/** --include /<dir2>/** --exclude node_modules/** -v
# --dry-run
# --log-file=/root/logs/rclone-sync.log