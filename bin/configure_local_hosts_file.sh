#!/usr/bin/env bash

. ./.env

function removehost() {
    HOST_NAME=$1
    if [ -n "$(grep ${HOST_NAME} ${HOST_HOSTS_FILE_PATH})" ]
    then
        echo "${HOST_NAME} Found in ${HOST_HOSTS_FILE_PATH}, Going to be removed...";
        sudo sed -i".bak" "/${HOST_NAME}/d" "${HOST_HOSTS_FILE_PATH}"
    else
        echo "${HOST_NAME} was not found in ${HOST_HOSTS_FILE_PATH}";
    fi
}

function addhost() {
    HOST_NAME=$1
    HOSTS_LINE="${HOST_IP}\t${HOST_NAME}"
    if [ -n "$(grep ${HOST_NAME} ${HOST_HOSTS_FILE_PATH})" ]
        then
            echo "${HOST_NAME} already exists : $(grep ${HOST_NAME} ${HOST_HOSTS_FILE_PATH})"
        else
            echo "Adding ${HOST_NAME} to ${HOST_HOSTS_FILE_PATH}";
            sudo -- sh -c -e "echo '${HOSTS_LINE}' >> /etc/hosts";

            if [ -n "$(grep ${HOST_NAME} ${HOST_HOSTS_FILE_PATH})" ]
                then
                    echo "${HOST_NAME} added \n $(grep ${HOST_NAME} ${HOST_HOSTS_FILE_PATH})";
                else
                    echo "Failed to Add ${HOST_NAME}";
            fi
    fi
}

removehost "${API_REST_HOST}"
removehost "${API_SEARCH_HOST}"
removehost "${WEB_HOST}"

addhost "${API_REST_HOST}"
addhost "${API_SEARCH_HOST}"
addhost "${WEB_HOST}"

cat "${HOST_HOSTS_FILE_PATH}"
