select count(*) 
from 
    sde.sde_dbtune
where 
    parameter_name = 'GEOMETRY_STORAGE'
and keyword = 'DEFAULTS' 
and config_string = 'PG_GEOMETRY';