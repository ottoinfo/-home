#!/bin/bash

# delete recursively
list="`find ${PWD} -name '*.png.bak'`"

rm ${list}