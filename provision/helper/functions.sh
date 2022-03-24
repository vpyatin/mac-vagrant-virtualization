#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'


function showMessage() {
    MESSAGE_DATE=$(date +"%Y-%m-%d %H:%M:%S")
    MESSAGE="$1"

    printf "[%s] %s\n" "${MESSAGE_DATE}" "${MESSAGE}"
}

function showTitle() {
    MESSAGE="$1"

    printf "${GREEN} ============================================================================================================\n"
    showMessage "$MESSAGE"
    printf " ============================================================================================================ ${NC}\n"
}

function showError() {
    MESSAGE_DATE=$(date +"%Y-%m-%d %H:%M:%S")
    MESSAGE="$1"

    printf "${RED}[%s] ERROR - %s${NC}\n" "${MESSAGE_DATE}" "${MESSAGE}"
}

function showSuccess() {
    MESSAGE="$1"

    showMessage "${GREEN} SUCCESS: $MESSAGE ${NC}"
}

function showWarning() {
    MESSAGE="$1"

    showMessage "${YELLOW} SUCCESS: $MESSAGE ${NC}"
}

function is_ssh_exist() {
    showTitle "Check if SSH id_rsa.pub is exist"
    if [[ ! -f ~/.ssh/id_rsa.pub ]]; then
        showError "No configured SSH found.\n"
        showSuccess "Generate SSH (y/n) ? "
        read ANSWER
        if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" ]]; then
            ssh-keygen -t rsa -b 4096 -C "$USER"
        else
            showSuccess "Interrupted by user."
            exit
        fi
    fi
}

function is_composer_exist() {
    showTitle "Check for composer"
    ## Check for composer
    composer -v > /dev/null 2>&1
    COMPOSER=$?
    if [[ $COMPOSER -ne 0 ]]; then
        showError "No composer found"
        showSuccess "Installing composer"
        showSuccess "sudo password might be required"
        showSuccess "Install composer (y/n) ?"
        read ANSWER
        if [[ "$ANSWER" -eq "y" || "$ANSWER" -eq "Y" ]]; then
            sudo curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
        else
            showSuccess "Interrupted by user."
            exit
        fi
    fi
}
