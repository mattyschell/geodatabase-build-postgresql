-- if default geometry is ransomware, make it optional instead of default
-- this is NA on cloud 
-- nothing calls this at the moment
update 
    sde.sde_dbtune
set 
    keyword = 'ST_GEOMETRY'
where 
    keyword = 'DEFAULTS'
and parameter_name = 'GEOMETRY_STORAGE'
and config_string = 'ST_GEOMETRY';
update 
    sde.sde_dbtune
set 
    keyword = 'DEFAULTS'
where 
    keyword = 'PG_GEOMETRY'
and parameter_name = 'GEOMETRY_STORAGE'
and config_string = 'PG_GEOMETRY'
and not exists (select 1 
                from 
                    sde.sde_dbtune
                where
                    keyword = 'DEFAULTS'
                and parameter_name = 'GEOMETRY_STORAGE'); 