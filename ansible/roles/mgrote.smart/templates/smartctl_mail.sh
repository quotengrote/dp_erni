#!/bin/bash
for i in {a..z}; do
    {{ telegraf_smart_pfad_zu_smartctl }} /dev/sd$i -a
done
