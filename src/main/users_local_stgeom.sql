create role 
    sde 
with 
    login superuser inherit createdb createrole noreplication password :'v1';
grant superuser to sde;