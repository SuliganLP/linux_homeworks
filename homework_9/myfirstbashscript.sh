#!/bin/bash
date +"%Y-%m-%d"

echo "hello $USER"

echo "Working directory: $(pwd)"

ps -ef | grep bioset | grep -v grep | wc -l

ls -la /etc/passwd | awk '{print $1}'
