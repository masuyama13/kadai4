#!/bin/bash

# 入力チェック
if [ ! $# -eq 2 ]; then
	echo "引数として自然数を2個入れてください" 1>&2
	exit 1
fi

if [ $1 -le 0 ] || [ $2 -le 0 ]; then
	echo "引数は1以上の整数です" 1>&2
	exit 1
fi

# 本体
x=$1
y=$2
r=$((x % y))
while [ $r -ge 0 ]
do
	if [ $r -eq 0 ];
	then
		echo $y
		exit 0
	else
		x=$y
		y=$r
	fi
	r=$((x % y))
done
