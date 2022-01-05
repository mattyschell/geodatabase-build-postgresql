create role 
    sde 
with 
    login nosuperuser inherit createdb createrole noreplication password :'v1';
grant azure_pg_admin to sde;