#!/bin/sh

echo "Running pre-shutdown script at $(date)"

number_files=$(ls -l /media/documents|wc -l)
if [ $number_files -gt 1 ] ; then
  tomb close
fi


# Need to create a service as 

# /etc/systemd/system/pre-shutdown.service with the following content:


# [Unit]
# Description=Pre-Shutdown Processes
# DefaultDependencies=no
# Before=shutdown.target reboot.target halt.target

# [Service]
# Type=oneshot
# ExecStart=/bin/true  # This is a dummy start command
# ExecStop=/home/hugoc/bin/tomb_close.sh # Your script to run at shutdown
# RemainAfterExit=true

# [Install]
# WantedBy=shutdown.target reboot.target halt.target