#!/bin/sh

# the if statement had, if-then-fi
# while loop has, while-do-done
# true and false are also Unix commands

echo "Network Tools Menu"
echo "1. IP Address Lookup Tool"
echo "2. Network Ping Monitor"
echo -n "Choose an option (1 or 2): "
read choice

if [ "$choice" = "1" ]; then
    echo "IP Address Lookup Tool"
    continue_lookup=true
    while [ "$continue_lookup" = true ]; do
        echo -n "Enter a hostname to lookup: "
        read hostname
        echo "Looking up $hostname..."
        nslookup "$hostname"
        echo -n "Do you want to lookup another hostname? (y/n): "
        read answer
        if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
            continue_lookup=false
            echo "Goodbye!"
        fi
    done
elif [ "$choice" = "2" ]; then
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
else
    echo "Invalid choice. Goodbye!"
fi


# exercise: write a script that continues to look up
# the ip address of a given hostname (using nslookup) until
# the user decides to stop