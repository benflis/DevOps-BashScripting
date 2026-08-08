# Server Stats

Lightweight collection of Bash scripts to gather basic server statistics and system information.

## Overview

This project provides simple, easy-to-run shell scripts that collect common server metrics such as CPU, memory, disk usage, network interfaces, and running processes. The scripts are intended for quick diagnostics, monitoring integrations, or inclusion in automation pipelines.

## Features

- CPU and load averages
- Memory usage (RAM and swap)
- Disk usage and inode usage
- Top processes by CPU and memory


## Requirements

- Unix-like OS (Linux, macOS)
- Bash (compatible with POSIX utilities)

Note: On macOS some Linux-specific tools (like `free`) may not be available; use `vm_stat` and `top` instead.

## Installation

Clone the repository or copy the scripts to your server:

```
git clone 
```

Ensure scripts are executable:

```
chmod 700 *.sh
```

To run it cd to the directory and 

```
./*.sh
```


