#!/bin/bash
var="$(nmcli connection show | head -n2 | tail -n1 | awk '{print $3}')"
var1="$(nmcli connection show | head -n2 | tail -n1 | awk '{print $1}')"
if [[ $var = vpn ]]; then
	echo "$var1"
else
	echo "" 
fi


