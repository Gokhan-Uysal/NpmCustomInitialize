#!/bin/bash

if [ $# == 0 ]
then
    echo "Use '-help' for help"
    exit
elif [ $# -gt 1 ]
then
    echo "Wrong argumnet count"
    exit
fi

function AddNode(){
    touch server.js
    touch index.html
    touch style.js

    CompleteHTML

    #You can add other npm packages in here
    npm init
    npm install -g nodemon
    npm install express
    npm install react
}

function ClearNode(){
    echo "Are you sure to delete npm and dependicies?(yes)"
    read input

    if [[ ${#input} -eq 0 ]] || [[ $input == "yes" ]]
    then
        rm -rf package-lock.json
        rm -rf node_modules
        rm -rf package.json
        rm -rf server.js
        rm -rf index.html
        rm -rf style.js
        echo "All npm files deleted"
    
    else
        echo
        echo "Wrong input try again :(("
    fi
}

function CompleteHTML(){
    echo -e "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>" > index.html
}

function Help(){
    echo "  '-help'     you know"
    echo
    echo "  '-add'      init npm with dependicies, core html, css and js" 
    echo
    echo "  '-clear'    clear all npm files"
}

ARG1="$1"

VAR1="-add"
VAR2="-clear"
VAR3="-help"

if [ $ARG1 == $VAR1 ]
then
    AddNode

elif [ $ARG1 == $VAR2 ]
then
    ClearNode

elif [ $1 == $VAR3 ]
then
    Help
fi    
