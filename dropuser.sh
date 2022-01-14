# export TARGETUSER=brooklyn
psql -t -c "drop schema if exists $TARGETUSER;"
psql -t -c "revoke usage on schema sde from $TARGETUSER;"
psql -t -c "revoke select, insert, update, delete on public.geometry_columns from $TARGETUSER;"
psql -t -c "revoke select, insert, update, delete on public.geography_columns from $TARGETUSER;"
psql -t -c "revoke select on spatial_ref_sys from $TARGETUSER;"
psql -t -c "drop user $TARGETUSER;"
