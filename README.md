# geodatabase-build-postgresql

We will create an ESRI Enterprise Geodatabase on PostgreSQL. Friends, this our ESRI Enterprise Geodatabase on PostgreSQL, our rules, the trick is never to be afraid.

## Tasks

* Create a database on the server
* Create the postgis extension in the new database
* Create the sde login role on the server and grant privileges to sde
* Create an sde schema on the database
* Create the ESRI enterprise geodatabase on the PostgreSQL database

## Set Up Database and Test That We Are Geodatabase-ready

```shell
$ export TARGETDATABASE=devtestdb
$ export TARGETSDEUSER=sde@host
$ export PGDATABASE=postgres
$ export PGUSER=adminuser@host
$ export PGPASSWORD=PostGisIsMyDatabae!
$ export PGHOST=host.postgres.database.xxx.yyy
$ export PGSSLMODE=require
$ ./setup.sh $TARGETDATABASE $TARGETSDEUSER
```

## Set up Geodatabase

If not already done, create a user environment variable *PGSSLMODE* with value *require*. Then from ArcCatalog or ArcGIS Pro create an sde.sde file with the details from above.

The script below requires the sde.sde file, ArcGIS Pro, and an ESRI keycodes file. Enabling the geodatabase may require several minutes and then we'll run some tests to make sure that we are good.

```bat
> set SDEFILE=C:\xxx\sde.sde
> set AUTHFILE=C:\xxx\keycodes
> set PGDATABASE=devtestdb
> set PGUSER=sde@host
> set PGPASSWORD=PostGisIsMyDatabae!
> set PGHOST=host.postgres.database.xxx.yyy
> set PGSSLMODE=require
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
$ export PGSSLMODE=require
$ ./teardown.sh $TARGETDATABASE
```

## Create a Geodatabase User

If the user already exists on the server this will fail harmlessly and continue to schema setup on the indicated database.

```shell
$ export TARGETUSER=brooklyn
$ export TARGETPASSWORD=SpreadLoveItsTheBrooklynWay
$ export PGDATABASE=devtestdb
$ export PGUSER=adminuser@host
$ export PGPASSWORD=PostGisIsMyDatabae!
$ export PGHOST=host.postgres.database.xxx.yyy
$ export PGSSLMODE=require
$ ./createuser.sh 
```