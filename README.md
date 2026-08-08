## Overview on server statistics

This project provides simple, easy-to-run shell scripts that collects CPU, RAM, Disk usage and top 5 processes based on CPU and RAM


[Server Statistics](https://roadmap.sh/projects/server-stats)


## Overview on log archive

A tool to archive logs on a set schedule by compressing them and storing them in a new directory


[Log Archiver](https://roadmap.sh/projects/log-archive-tool)

This Script accepts 2 arguments 
```
./log-archive.sh (directory where you logs are stored) (directory where you want to store the new compressed logs)
```

## Overview on nginx log analyzer


A shell script that reads the log file and provides the following information:

Top 5 IP addresses with the most requests

Top 5 most requested paths

Top 5 response status codes

Top 5 user agents


[Nginx Log Analyzer](https://roadmap.sh/projects/nginx-log-analyser)

This script requires 1 argument

```
./nginx-log-analyzer.sh (nginx file)
```

## Requirements

- Unix-like OS (Linux, macOS)
- Bash (compatible with POSIX utilities)

Note: On macOS some Linux-specific tools (like `free`) may not be available; use `vm_stat` and `top` instead.

## Installation

Clone the repository or copy the scripts to your server:

```
git clone https://github.com/benflis/DevOps-BashScripting.git
```

Ensure scripts are executable:

```
chmod 700 *.sh
```

To run it cd to the directory and 

```
./*.sh
```


