#!/bin/bash

# enable cpu governor ondemand mode
for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo "ondemand" > $file; done

# allow host to schedule new processes on all_cores
all_cores=0-15
systemctl set-property --runtime -- user.slice AllowedCPUs=$all_cores
systemctl set-property --runtime -- system.slice AllowedCPUs=$all_cores
systemctl set-property --runtime -- init.scope AllowedCPUs=$all_cores
