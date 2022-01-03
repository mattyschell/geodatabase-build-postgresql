select 
    count(*) as postgisextensioncount
from 
    pg_extension
where 
    extname='postgis';