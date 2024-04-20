#!/bin/sh

# get-http-status-codes.sh - Gets HTTP status codes for a list of URLs

# Usage:
#  Assuming a file named 'input' with one URL per line
#  the following command will output the HTTP status code,
#  a space, and the URL for each line of input
#     cat input | xargs get-http-status-codes.sh

# Notes:
#  curl -I = only get headers
#  2>/dev/null = prevent stderr from going through the pipe
#                (causes problems when piping curl)
#  head -1 = HTTP response code should be first line of output from curl
#  awk '{print $2}' = HTTP code should be second column

baseUrl="http://www.google.com/" # replace with target site URL

for arg in $@ ; do

    currUrl=$baseUrl$arg

    statusCode=`curl -I 2>/dev/null $currUrl | head -1 | awk '{print $2}'`

    echo $statusCode $currUrl

done
Comment
