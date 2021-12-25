#!/bin/bash

echo -e "This script should only be executed on a fresh install of linux"
echo -e "Executing this script may may result in file loss"
echo -e "=======================================\n\n\n"

while true; do
    echo -e "Are you sure you want to proceed?"
    read -p "" yn
    case $yn in
    [Y/y]*) break ;;
    [N/n]*) exit ;;
    *) echo "Please answer yes (Y/y) or no (N/n)." ;;
    esac
done

echo -e "======================================="
echo -e "           Configuring Linux           "
echo -e "=======================================\n\n"

/bin/bash scripts/terminal.sh
