#!/bin/bash

echo
echo "Will search for .pu files in uml/ to process"
echo "Generated images will be placed in images/"
echo

PWD=$(pwd)

java -jar uml/plantuml.jar uml -o "$PWD/images"
