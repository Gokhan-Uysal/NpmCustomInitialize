#!/bin/bash

function MakeDir(){
    
    if ! [ -d ~/bin ]
    then
       mkdir ~/bin
    fi 

}

function MoveFiles(){

    cp $1 ~/bin/$1       
}

function Validation(){

    TOOL=$1

    if ! [ -x "$(command -v $TOOL)" ]; then
        echo Installing $TOOL...;
        return 1;
    else
        echo Already have $TOOL nice!;
        return 0;
    fi
}

MakeDir
MoveFiles ./init.sh
MoveFiles ./nodeRun.sh
MoveFiles ./.bash_profile
Validation node

RT1=$?
if [ $RT1 -eq 1 ]
then
    curl "https://nodejs.org/dist/v16.17.1/node-v16.17.1.tar.gz" > "node.tar.gz"
    tar -xvf node.tar.gz
fi

Validation npm

RT2=$?
if [ $RT2 -eq 1 ]
then
    npm install -g npm
fi





