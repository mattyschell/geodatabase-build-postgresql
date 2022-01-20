#!/bin/bash
# verify we have a database target
if [[ -z "$1" ]]; then
   echo "missing input variable database name"
   exit 1
else
   database=$1
fi
if [[ -z "$2" ]]; then
   echo "missing input sde login user name"
   exit 1
else
   sdeloginuser=$2
fi
psql -t -c "create database $database;"
export PGDATABASE=$database
psql -t -f ./src/main/database.sql
sdepwd=$PGPASSWORD
if [ $PGHOST = 'localhost' ]; then
	psql -t -v v1=$sdepwd -f ./src/main/users_local.sql
else
	psql -t -v v1=$sdepwd -f ./src/main/users_azure.sql
fi
export PGADMINUSER=$PGUSER
export PGUSER=$sdeloginuser
psql -t -f ./src/main/schema.sql
export PGUSER=$PGADMINUSER
./src/test/run-db-tests.sh 

