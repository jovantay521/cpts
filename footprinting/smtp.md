IP=10.129.219.56

sudo nmap $IP -p25 --script smtp-open-relay -vv
