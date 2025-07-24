#!/bin/bash
#This script converts g16 output to g09 output
#This enables it to be visualized using gv5

file=`echo $1 | sed 's,.log,,g' | sed 's,.com,,g' | sed 's,.arch,,g' | sed 's,.xyz,,g' `
echo gv5_$file.log $file.arch; cat $file.log | sed '/Dipole orientation/,$d' > gv5_$file.log; csplit -q $file.log %GINC% {1}; mv xx00 $file.arch; cat $file.arch >> gv5_$file.log
