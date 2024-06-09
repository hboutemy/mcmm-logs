#!/bin/bash

download() {
  f=$1
  echo $f $(cat $f | wc -l)
  for path in `cat $f`
  do
    target=sboms/$path
    mkdir -p $(dirname $target)
    [ -f $target ] || ( wget https://repo.maven.apache.org/maven2/$path -O $target -q && du -h $target )
  done
}

for format in cyclonedx spdx
do
  for f in $format/*/$1*.txt
  do
    download $f
  done
done
