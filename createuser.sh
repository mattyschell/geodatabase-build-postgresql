# export TARGETUSER=brooklyn
# export TARGETPASSWORD=SpreadLoveItsTheBrooklynWay
psql -t -c "create role $TARGETUSER login ENCRYPTED PASSWORD '$TARGETPASSWORD' nosuperuser nocreatedb nocreaterole;"
psql -t -c "grant $TARGETUSER to sde;"
psql -t -c "grant $TARGETUSER to azure_pg_admin;"
psql -t -c "create schema if not exists $TARGETUSER authorization $TARGETUSER;"
psql -t -c "grant usage on schema sde to $TARGETUSER;"
psql -t -c "grant select, insert, update, delete on public.geometry_columns TO $TARGETUSER;"
psql -t -c "grant select, insert, update, delete on public.geography_columns TO $TARGETUSER;"
psql -t -c "grant select on spatial_ref_sys to $TARGETUSER;"
export PGUSER=$TARGETUSER
export PGPASSWORD=$TARGETPASSWORD
./src/test/run-user-tests.sh 