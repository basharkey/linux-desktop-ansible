#!/bin/bash

## Enable CPU governor performance mode
for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo "performance" > $file; done
