#!/bin/sh

# the if statement had, if-then-fi
# while loop has, while-do-done
# true and false are also Unix commands

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

# exercise: write a script that continues to look up
# the ip address of a given hostname (using nslookup) until
# the user decides to stop
