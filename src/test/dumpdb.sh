export PGDATABASE=xxx
export PGUSER=xxx
export PGPASSWORD=xxx
export PGHOST=xxx
export PGSSLMODE=allow
pg_dump -d $PGDATABASE -f /c/Temp/$PGDATABASE.sql