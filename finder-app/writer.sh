#!/bin/sh

# Check that both arguments were specified
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required - writefile and writestr"
    exit 1
fi

writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Create/overwrite the file with the content
echo "$writestr" > "$writefile"

# Check that the file was created successfully
if [ ! -f "$writefile" ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi
