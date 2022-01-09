#!/bin/bash

echo -e "This script should only be executed on a fresh install of linux"
echo -e "Executing this script may may result in file loss"
echo -e "=============================================\n\n"

VARIANTS=("server" "minimal" "essentials" "full")
SELECTED_VARIANT=""

containsElement() {
    local e match="$1"
    shift
    for e; do [[ "$e" == "$match" ]] && return 0; done
    return 1
}

if [ -z $1 ]; then
    SELECTED_VARIANT='essentials'
else
    SELECTED_VARIANT=$1
fi

if [[ " ${VARIANTS[*]} " =~ " ${SELECTED_VARIANT} " ]]; then
    echo "Selected Variant is $SELECTED_VARIANT"
else
    echo "Invalid variant specified"
    echo "Possible variants are: server / minimal, essentials, full"
fi

while true; do
    echo -e "Are you sure you want to proceed?"
    read -p "" yn
    case $yn in
    [Y/y]*) break ;;
    [N/n]*) exit ;;
    *) echo "Please answer yes (Y/y) or no (N/n)." ;;
    esac
done

echo -e "============================================="
echo -e "                Updating Linux               "
echo -e "$ sudo apt-get update && sudo apt-get upgrade -y"
echo -e "=============================================\n\n"

sudo apt-get update && sudo apt-get upgrade -y

echo -e "============================================="
echo -e "              Configuring Linux              "
echo -e "=============================================\n\n"

if [[ "$SELECTED_VARIANT" == "server" || "$SELECTED_VARIANT" == "minimal" ]]; then
    /bin/bash scripts/minimal.sh
fi

if [[ "$SELECTED_VARIANT" == "essentials" ]]; then
    /bin/bash scripts/minimal.sh
    /bin/bash scripts/essentials.sh
fi

if [[ "$SELECTED_VARIANT" == "full" ]]; then
    /bin/bash scripts/minimal.sh
    /bin/bash scripts/essentials.sh
    /bin/bash scripts/full.sh
fi

echo -e "============================================="
echo -e "             All Programs Installed          "
echo -e "=============================================\n\n"

/bin/bash scripts/terminal.sh
