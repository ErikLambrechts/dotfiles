#!/bin/bash

# print 2 pages to single page with minimal white space
function eco_print() {
  # MARGIN=${1:-foo}
  pdfcrop --margins '50 5 50 5' $1 __tmp.pdf
  pdfnup --scale 1 --a4paper __tmp.pdf -o $2
  rm __tmp.pdf
}
