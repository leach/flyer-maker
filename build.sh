#!/bin/bash

version=0.0.1

mvn clean package

str='#!/bin/sh \n MYSELF=`which "$0" 2>/dev/null` \n [ $? -gt 0 -a -f "$0" ] && MYSELF="./$0" \n java=java \n if test -n "$JAVA_HOME"; then \n java="$JAVA_HOME/bin/java" \n fi \n exec "$java" -Dcli=true $java_args -jar $MYSELF "$@" \n exit 1'

cd target

echo -e $str >> flyermaker

cat flyer-maker.jar >> flyermaker

chmod +x flyermaker

cp classes/application.properties .

zip -r flyermaker-${version}.zip flyermaker application.properties

tar zcvf flyermaker-${version}.tar.gz flyermaker application.properties
