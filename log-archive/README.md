# Log Archive Tool

## Overview:
 The Goal is to build a tool to archive logs on a define schedule by compressing and storing them in a new directory  and notify the admin via email if the archive was successful or not 

## Tools/Technologies:
  - Linux-based system and Utilities 
  - VIM
  - Bash shell Scripting 
  - Git 
  - Tar.gz 
  

### Variant 1:
 Here the script will be executed manually from the CLI using `` log-archive /var/log`` with ``/var/log`` being the argument and log-archive the command
You need to make the script executable `` chmod +x``



### Variant 2: 
 Automate the execution of the tool for a daily execution by  creating a new cronjob
```
01 12 * * * /usr/local/bin/log-archive /var/log
``` 

 
