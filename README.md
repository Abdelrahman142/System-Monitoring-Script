# System-Monitoring-Script
Description: This script monitors system resources like CPU, memory, disk usage, and running processes, generates a detailed system report, and sends it via email for regular monitoring. It's useful for system administrators and anyone who needs automated, periodic system health checks.

# System Monitoring Script

This bash script is designed to monitor key system resources, such as:

- CPU usage
- Memory usage
- Disk usage
- Top memory-consuming processes

The script generates a system report and sends it as an email for easy monitoring. It can be configured to run periodically using cron jobs, making it suitable for regular system health checks.

---

## Features

- Collects CPU, memory, and disk usage statistics.
- Identifies the top memory-consuming processes.
- Generates a system health report.
- Sends the generated report via email (using Gmail's SMTP).
- Easily configurable for different email providers (Gmail is used in this example).
- Can be scheduled to run automatically using cron jobs.

---

## Requirements

- Linux-based system (Ubuntu, CentOS, etc.)
- `sendemail` tool installed for sending emails.
- Email account (Gmail is used in this example, but other providers can be configured).
- Access to the terminal/command line.

---

## Setup and Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/system-monitoring-script.git

## How To USE :
#Navigate to the script directory: 

##put your path in REPORT_FILE varable
```bash


cd system-monitoring-script
#Make the script executable:
chmod +x generate_report.sh
```

##Modify the script to include your email and SMTP password: Open generate_report.sh and set the following variables with your information:
EMAIL_SENDER="your-email@gmail.com"
EMAIL_PASSWORD="your-gmail-app-password"
EMAIL_SMTP="smtp.gmail.com:587"
EMAIL_RECIPIENT="recipient-email@gmail.com"
#Run the script manually:
./generate_report.sh
OR
#Schedule the script to run periodically using cron: Open the cron editor with:
```
crontab -e
THEN
Add the following line to run the script every hour:
0 * * * * /path/to/generate_report.sh
```
#YOU CAN MODFY IT AS YOU LIKE!!!!


##Example Report Output
```
=====================================
System Monitoring Report
Generated on: Mon Sep 20 15:00:00 UTC 2025
=====================================

Current User: root
-------------------------------------
Disk Usage:
/dev/sda1 40%
/dev/sdb1 85%
-------------------------------------
CPU Usage: 23.5%
-------------------------------------
Memory Usage:
Total: 16G
Used: 8G
Free: 7.5G
-------------------------------------
Top 5 Memory-Consuming Processes:
  PID USER     %MEM COMMAND
  1234 root     15.0  /usr/bin/abc
  5678 user     8.5   /usr/bin/xyz
  ...
-------------------------------------
```











