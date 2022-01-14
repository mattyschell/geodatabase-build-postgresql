create table gdbuserready (
    id serial primary key
   ,geom geometry(Point, 2263)
   ,name varchar(128)
);
create index gdbuserready_gix
on 
    gdbuserready
using 
    gist (geom);
insert into 
    gdbuserready (geom, name) 
values 
    (ST_GeomFromText('POINT(0 0)', 2263) ,'brooklyn');
-- where Brooklyn at?
select 
    a.name 
from 
    gdbuserready a
where 
    ST_Dwithin(a.geom
              ,ST_GeomFromText('POINT(0 0)', 2263)
              ,100);
drop table gdbuserready;
    
