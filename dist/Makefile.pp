#!/bin/sh

VERSION=$1
APP=httpsum-$VERSION.`uname -s`
APP=`echo $APP | tr A-Z a-z`

rm -f $APP

pp -I lib -o $APP -M Getopt::GUI::Long httpsum
