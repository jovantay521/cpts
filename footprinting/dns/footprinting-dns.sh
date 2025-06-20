#!/bin/bash

# Configuration variables
DOMAIN="inlanefreight.htb"
NAMESERVER="10.129.133.196"
WORDLIST="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"
DNSENUM_OUTPUT="subdomains.txt"

# Query all record types
echo -e "\n[*] Performing ANY query..."
dig any $DOMAIN @$NAMESERVER

# Attempt zone transfer
echo -e "\n[*] Attempting AXFR zone transfer..."
dig axfr $DOMAIN @$NAMESERVER

# Run dnsenum with the given list
# -p 0: Disables reverse IPv4 range brute-forcing (default would try 1–255 IPs)
# -s 0: Disables reverse IPv6 range brute-forcing
echo -e "\n[*] Running dnsenum..."
dnsenum --dnsserver "$NAMESERVER" --enum -p 0 -s 0 -o "$DNSENUM_OUTPUT" -f "$WORDLIST" "$DOMAIN"
