#!/bin/bash
echo $(sensors | awk '/^edge:/ {print $2}') | cut -b '2-9'
