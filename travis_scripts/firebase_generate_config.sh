#!/bin/bash

set_prod_env () {
    APIKEY=$FIREBASE_CONFIG_APIKEY_PROD
    PROJECTID=$FIREBASE_PROJECT_ID_PROD
    MESSAGINGID=$FIREBASE_CONFIG_MSGID_PROD
}

set_dev_env () {
    APIKEY=$FIREBASE_CONFIG_APIKEY_DEV
    PROJECTID=$FIREBASE_PROJECT_ID_DEV
    MESSAGINGID=$FIREBASE_CONFIG_MSGID_DEV
}

if [ $TRAVIS_BRANCH == "master" ]; then
    echo "Production env..."
    set_prod_env
elif [ $TRAVIS_BRANCH == "develop" ]; then
    echo "Develop env..."
    set_dev_env
else
    echo "No special env... jic going for Develop"
    set_dev_env
fi

./firebase_template_config APIKEY PROJECTID MESSAGINGID > ../scripts/config.js