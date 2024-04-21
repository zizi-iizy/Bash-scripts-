!/bin/Bash 
if [ $# -eq  0 ]; then 
        echo "usage $0 "
        exit 1
fi

input_file=$1
output_file="url_reponse_codes.txt"
while IFS= read -r url; do 
        response_code=$(curl -s -o/dev/null -w "%{http_code}" "$url")
        echo "URL: $url | response code: $response_code" | tee  "$output_file"
done < "$input_file"
echo "done" 
