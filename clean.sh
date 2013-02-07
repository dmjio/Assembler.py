#!/bin/bash
for f in *.hack; do echo "Removing .hack file: $f"; rm $f; done
for f in *.pyc; do echo "Removing .pyc file: $f"; rm $f; done
