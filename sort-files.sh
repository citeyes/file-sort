#!/bin/bash
source=$1
target=$2
format=$3

copy_f()
{
	f=$1
	echo FILE $f
	target=$2
	dy=`stat -f %SB -t %Y "$f"`
	if [ ! -d $target/$dy ]; then
		mkdir $target/$dy
	fi
	df=`stat -f %SB -t %Y%m%d%H%M "$f"`
	fn=$(basename "$f")
	cp -vpn "$f" "$target/$dy/${df}_$fn"
	#echo "$f ==> $target/$dy/${df}_$fn"
}
export -f copy_f
find $source -name "*.$format" -exec bash -c "copy_f {} $target" \;
