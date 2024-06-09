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

find sboms -type f | cut -c 7- | grep -v '.txt$' | xargs dirname | sort -u | xargs dirname | sort | uniq -c > sboms/ga.txt
find sboms -type f | cut -c 7- | grep 'cyclonedx.json$' | xargs dirname | sort -u | xargs dirname | sort | uniq -c > sboms/ga-cyclonedx.json.txt
find sboms -type f | cut -c 7- | grep 'cyclonedx.xml$' | xargs dirname | sort -u | xargs dirname | sort | uniq -c > sboms/ga-cyclonedx.xml.txt
find sboms -type f | cut -c 7- | grep '.spdx.json$' | xargs dirname | sort -u | xargs dirname | sort | uniq -c > sboms/ga.spdx.json.txt
