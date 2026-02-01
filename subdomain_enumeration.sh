#!/bin/bash
# Subdomain enumeration with subfinder
subfinder -d $1 -o subdomains.txt
cat subdomains.txt | httpx -o active_subdomains.txt
