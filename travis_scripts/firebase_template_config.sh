#!/bin/bash
#Set variables
APIKEY=$1
PROJECTID=$2
MESSAGINGID=$3

#Print Firebase config
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