#!/bin/sh
set -e

JAVAOPTIONS=""
JAVAAPPS=""
JAVAPARAMS=""

#JDBC
unset JAVAPARAMS
for var in `printenv | egrep ^JDBC | awk -F= '{ print $1 }' `
do
	value=$(eval "echo \"\$${var}\"")
	JAVAPARAMS="$JAVAPARAMS --$var=$value"

done

echo "JAVAPARAMS: $JAVAPARAMS"

if [ -z "$1" ]; then
	if [ ! -e /app.jar  ]; then 
		echo "ERROR: /app.jar not found"
		exit 1
	fi

	exec java -jar /app.jar $JAVAPARAMS

else
    exec "$@"
fi
