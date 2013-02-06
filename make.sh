#!/bin/bash
FILES="@"
for f in $FILES
do
    if [ -f ${f}.asm ]
    then
        Assembler.py $f.asm
    fi 
done
