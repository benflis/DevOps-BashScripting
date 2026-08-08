#!/bin/bash

directory=$1
different_directory=$2
current_time=$(date "+%Y%m%d_%H%M%S")

tar -czvf $different_directory/logs_archive_$current_time.tar.gz $directory
