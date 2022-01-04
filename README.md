# geodatabase-build-postgresql

We will create an ESRI Enterprise Geodatabase on PostgreSQL. Friends, this our ESRI Enterprise Geodatabase PostgreSQL, our rules, the trick is never to be afraid.

## Tasks

* Create a database on the server
* Create the postgis extension in the new database
* Create the sde login role on the server and grant privileges to sde
* Create an sde schema on the database
* Create the ESRI enterprise geodatabase on the PostgreSQL database

## Set Up Database 

```shell
$ export TARGETDATABASE=devtestdb
$ export TARGETSDEUSER=sde@host
$ export PGDATABASE=postgres
$ export PGUSER=adminuser@host
$ export PGPASSWORD=PostGisIsMyDatabae!
$ export PGHOST=host.postgres.database.xxx.yyy
$ ./setup.sh $TARGETDATABASE $TARGETSDEUSER
```

## Test

Test that we are ready for geodatabase creation.

```shell
$ export PGDATABASE=devtestdb
$ export PGUSER=adminuser@host
$ export PGPASSWORD=PostGisIsMyDatabae!
$ ./src/test/run-all-tests.sh 
```

## Set up Geodatabase

Requires ArcGIS Pro, [correctly placed st_geometry.dll](https://pro.arcgis.com/en/pro-app/latest/help/data/geodatabases/manage-postgresql/setup-geodatabase-postgresql-windows.htm), ESRI keycodes file, and a connection using the details from above. 

Enabling the geodatabase may require several minutes.

```bat
> set SDEFILE=C:\xxx\sde.sde
> set AUTHFILE=C:\xxx\keycodes
> set PGDATABASE=devtestdb
> set PGUSER=sde@host
> set PGPASSWORD=PostGisIsMyDatabae!
> set PGHOST=host.postgres.database.xxx.yyy
> enablegdb.bat
```

## Teardown

Tear down the PostgreSQL database, geodatabase, and sde user. This is intended for development and testing, we don't usually remove the sde user on an active database cluster.

```shell
$ export TARGETDATABASE=devtestdb
$ export PGDATABASE=postgres
$ export PGUSER=adminuser@host
$ export PGPASSWORD=PostGisIsMyDatabae!
$ export PGHOST=host.postgres.database.xxx.yyy
$ ./teardown.sh $TARGETDATABASE
```
