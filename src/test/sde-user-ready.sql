select 
    rolname 
from 
    pg_catalog.pg_roles
where 
    rolinherit = true
and rolcreaterole = true
and rolcreatedb = true
and rolcanlogin = true
and rolname = 'sde';