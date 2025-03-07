#!/bin/bash
# sudo apt install cpulimit sysstat wlr-randr procps

# https://forum.clockworkpi.com/t/sleep-support-development-for-cm4/14797

CPU_GOVERNOR="performance"  # or "ondemand"

if pgrep -x "pidstat" > /dev/null || pgrep -x "cpulimit" > /dev/null || [ "$(cat /sys/class/backlight/backlight@0/brightness)" = "0" ]; then
    echo "Resuming or stopping processes as required."
    killall pidstat
    killall cpulimit
    wlr-randr --output DSI-1 --on
    pkill -f qsleep_bg
    cat /tmp/brightness > /sys/class/backlight/backlight@0/brightness
    echo $CPU_GOVERNOR | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    killall qsleep.sh
    killall lxde-pi-shutdown-helper
    exit 1
fi

cat /sys/class/backlight/backlight@0/brightness > /tmp/brightness
echo 0 > /sys/class/backlight/backlight@0/brightness
echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Shut down GPU after some idling
nohup bash -c '(exec -a qsleep_bg sleep 60); if [ "`cat /sys/class/backlight/backlight@0/brightness`" = "0" ] ; then wlr-randr --output DSI-1 --off; fi' > /dev/null 2>&1 &
disown

# Put all CPU-heavy processes to sleep, progressively re-checking every 60 seconds
nohup bash -c '
while true; do 
    for pid in $(pidstat 1 1 | grep "^Average:" | awk "BEGIN {FS=\"[[:space:]]+\"} \$8 > 5 {print \$3}"); do 
        cpulimit -z -b -l 1 --pid=$pid; 
    done; 
    exec -a qsleep_bg sleep 60; 
done' > /dev/null 2>&1 &
disown