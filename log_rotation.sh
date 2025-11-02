#!/bin/bash
 
dir=$1
 
 
#verify if it's correct directory
if [ ! -d "$dir" ]; then
        echo "Not a Directory"
        exit 1;
fi
 
#define your destiation directory
output_dir="/tmp/aman"
 
#main logic
for i in "$dir"/*.log; do
        if [ -f "$i" ]; then
                filename=$(basename "$i" .log)
                output_file="${output_dir}/${filename}-$(date +"%Y-%m-%d").log.gz"
                gzip -c "$i" > "$output_file"
        fi
done
 
#script completion message
echo "Script Completed Successfully--->"