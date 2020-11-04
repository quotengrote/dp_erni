#!/bin/bash
for i in {a..z}; do
    smartctl /dev/sd$i -a | grep "Device Model: "
    smartctl /dev/sd$i -a | grep "SMART overall-health self-assessment test result: " | sed -r 's/SMART overall-health self-assessment test result: /SMART test result: /g'| sed -r "s/(PASSED)/`printf "\033[92m"`\1`printf "\033[0m"`/g" | sed -r "s/(FAILED)/`printf "\033[31m"`\1`printf "\033[0m"`/g"
done
