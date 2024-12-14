#!/bin/bash
var1=20
var2=30
var3=$( expr $var1 + $var2 )
echo $var3

var4=$[$var2 / $var1]
echo $var4

var5=$(echo "scale=4; $var2 / $var1" | bc)
echo $var5
