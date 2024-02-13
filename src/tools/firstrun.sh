#!/bin/bash

# Define the nameserver line to add
nameserver_line="nameserver 8.8.8.8"
nameserver_line2="nameserver 8.8.4.4" 

# Define the file path
file="/etc/resolv.conf"

sudo apt install -y docker docker-compose

# Check if the file exists and is readable
if [ -f "$file" ] && [ -r "$file" ]; then
    # Check if the nameserver line already exists in the file
    if ! grep -q "^$nameserver_line" "$file"; then
        # Add the nameserver line at the beginning of the file
        echo "$nameserver_line" | cat - "$file" > temp && mv temp "$file"
        echo "Added nameserver line to $file"
    else
        echo "Nameserver line already exists in $file"
    fi
else
    echo "File $file does not exist or is not readable"
fi

if [ -f "$file" ] && [ -r "$file" ]; then
    # Check if the nameserver line already exists in the file
    if ! grep -q "^$nameserver_line2" "$file"; then
        # Add the nameserver line at the beginning of the file
        echo "$nameserver_line2" | cat - "$file" > temp && mv temp "$file"
        echo "Added nameserver line to $file"
    else
        echo "Nameserver line already exists in $file"
    fi
else
    echo "File $file does not exist or is not readable"
fi