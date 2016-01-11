#!/bin/sh
sed --silent 's/;/,/g; 1{p;n}; /^[21]\/2\/2007/p'
