#!/bin/bash

# optipng -keep
list="`find ${PWD} -name '*.png'`"

optipng -keep ${list}