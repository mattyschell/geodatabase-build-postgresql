create role 
    azure_pg_admin 
with 
    nosuperuser nocreatedb nocreaterole inherit nologin replication	nobypassrls;
--create role sde with login superuser inherit createdb createrole noreplication password :'v1';
create role 
    sde 
with 
    login superuser inherit createdb createrole noreplication password :'v1';
grant azure_pg_admin to sde;