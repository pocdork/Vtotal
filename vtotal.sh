#! /bin/bash
printf "\n${RED}Getting Subdomain from Virustotal:${NC}\n"
date +"%T"
RED='\033[0;31m'
NC='\033[0m'
read target
curl --request GET --url "https://www.virustotal.com/api/v3/domains/$target/subdomains?limit=40" --header 'x-apikey: YOUR_API_KEY' | grep -o '"id": "[^"]*' | grep $target | cut -c 8- | tee -a "./virustotal.txt"
curl --request GET --url "https://www.virustotal.com/api/v3/domains/$target/subdomains?cursor=STQwCi4%3D&limit=40" --header 'x-apikey: YOUR_API_KEY' | grep -o '"id": "[^"]*' | grep $target | cut -c 8- | tee -a "./virustotal.txt"
curl --request GET --url "https://www.virustotal.com/api/v3/domains/$target/subdomains?cursor=STgwCi4%3D&limit=40" --header 'x-apikey: YOUR_API_KEY' | grep -o '"id": "[^"]*' | grep $target | cut -c 8- | tee -a "./virustotal.txt" 
printf "\n${RED}Finished Virustotal Subdomain Fetching${NC}\n"
date +"%T"
