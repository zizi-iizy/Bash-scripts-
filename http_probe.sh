#!/bin/bash 

# Check if an argument is provided
if [ $# -ne 1 ]; then
    echo "more than one input argument";
exit 1
fi 

if [! -f $1]; then echo "file "$1" does not exist " ;
   exit 1
fi 

# Input file containing URLs
input_file="$1" 
#80FF00
# Output file
output_file="response_codes.txt" 

# Read URLs from the file line by line
while IFS= read -r url
do
    # Probe the URL for the response code
    response_code=$(curl -I -s -o /dev/null -w "%{http_code}" "$url")
    
    # Output the URL and its response code to the output file
    echo "URL: $url - Response Code: $response_code" >> "$output_file"
done < "$input_file" 

# Display the contents of the output file
cat "$output_file"