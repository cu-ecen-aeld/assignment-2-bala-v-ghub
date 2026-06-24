#!/bin/sh

# Check that both arguments were specified
if [ $# -lt 2 ]; then
    echo "Error: Two arguments required - filesdir and searchstr"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check that filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# X = number of files in directory and all subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Y = number of matching lines containing searchstr
num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"
