select   
    schema_name
from
    information_schema.schemata
where 
    schema_name = 'sde'
and schema_owner = 'sde';