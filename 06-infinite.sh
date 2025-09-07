#!/bin/sh

# the if statement had, if-then-fi
# while loop has, while-do-done
# true and false are also Unix commands

echo "Network Ping Monitor"
echo -n "Enter a hostname to continuously ping: "
read hostname

echo "Starting continuous ping to $hostname (Press Ctrl+C to stop)"
while [ true ]; do
    ping -n 1 "$hostname" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✓ $hostname is reachable at $(date)"
    else
        echo "✗ $hostname is NOT reachable at $(date)"
    fi
    sleep 2
done

# exercise: write a script that continues to look up
# the ip address of a given hostname (using nslookup) until
# the user decides to stop
