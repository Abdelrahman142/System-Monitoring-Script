#!/bin/bash


echo "System Monitoring Report"

echo "========================="

whoami

echo "========================="

date

echo "========================="

echo "Disk Usage......"
{
# Set the threshold for disk usage
threshold=80

# Get disk usage for each mounted partition
disk_usage=$(df -h --output=source,pcent | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $1 " " $2}' | sed 's/%//')

# Loop through the disk usage data
while read -r partition usage; do
  # Check if usage exceeds the threshold
  if [ "$usage" -ge "$threshold" ]; then
    echo "Warning: Disk usage on $partition is at ${usage}%."
  else
    echo "Disk usage on $partition is at ${usage}%. All good."
  fi
done <<< "$disk_usage"


echo "========================="

echo "Cpu Usege......."
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "CPU USE IS : ${cpu_usage} %"

echo "========================"
total=$(free -h |grep Mem | awk '{print $2}')
used=$(free -h |grep Mem | awk '{print $3}')
free=$(free -h |grep Mem | awk '{print $4}')
echo "Total Memory: ${total}"
echo "Uesd Memory: ${used} "
echo "Free Memory: ${free} "

echo "========================"
procss=$(ps -eo pid,user,%mem,comm --sort=%mem| head -6)

echo "Top 5 Memory-Consuming Processes: ${procss}"
echo "========================"
}
REPORT_FILE=<put your path here>/report.txt
EMAIL_SENDER="example@gmail.com"
EMAIL_PASSWORD=""  # Gmail App Password
EMAIL_SMTP="smtp.gmail.com:587"
EMAIL_RECIPIENT="example@gmail.com"

# Temporary file for report
REPORT_FILE= <put your path here> /report.txt
sendemail -f "$EMAIL_SENDER" \
          -t "$EMAIL_RECIPIENT" \
          -u "System Monitoring Report - $(date)" \
          -m "$(cat $REPORT_FILE)" \
          -s "$EMAIL_SMTP" \
          -o tls=yes \
          -xu "$EMAIL_SENDER" \
          -xp "$EMAIL_PASSWORD"

# Check if the email was sent successfully
if [ $? -eq 0 ]; then
  echo "Email sent successfully to $EMAIL_RECIPIENT."
else
  echo "Failed to send email."
fi
