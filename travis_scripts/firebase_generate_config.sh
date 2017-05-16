#!/bin/bash

# Prod variable
set_prod_env () {
    APIKEY=$FIREBASE_CONFIG_APIKEY_PROD
    PROJECTID=$FIREBASE_PROJECT_ID_PROD
    MESSAGINGID=$FIREBASE_CONFIG_MSGID_PROD
}

# Dev variables
set_dev_env () {
    APIKEY=$FIREBASE_CONFIG_APIKEY_DEV
    PROJECTID=$FIREBASE_PROJECT_ID_DEV
    MESSAGINGID=$FIREBASE_CONFIG_MSGID_DEV
}

if [ $TRAVIS_BRANCH == "master" ]; then
    echo "# Production env..."
    set_prod_env
elif [ $TRAVIS_BRANCH == "develop" ]; then
    echo "# Develop env..."
    set_dev_env
else
    echo "# No special env... jic going for Develop"
    set_dev_env
fi

# Template
cat << EOF
var config = {
        apiKey: '$APIKEY',
        authDomain: '$PROJECTID.firebaseapp.com',
        databaseURL: 'https://$PROJECTID.firebaseio.com',
        projectId: '$PROJECTID',
        storageBucket: '$PROJECTID.appspot.com',
        messagingSenderId: '$MESSAGINGID'
};
EOF