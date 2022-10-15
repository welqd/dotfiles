#!/bin/bash
echo $(sensors | awk '/^Tctl:/ {print $2}') | cut -b '2-9' 
