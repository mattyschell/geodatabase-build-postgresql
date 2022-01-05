#!/bin/bash
#cd "$(dirname "$0")"
# verify we have a schema target
if [[ -z "$1" ]]; then
   echo "missing input variable database name"
   exit 1
else
   database=$1
fi
psql -t -c "drop database $database;"
if [ $PGHOST = 'localhost' ]; then
	psql -t -c "drop user azure_pg_admin;"
fi
psql -t -c "drop user sde;"
