#!/bin/bash
for f in *.asm; do echo "Making .hack file for $f"; Assembler.py $f; done

