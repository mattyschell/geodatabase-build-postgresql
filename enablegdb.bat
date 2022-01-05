REM execute from ArcGIS Pro conda environment
REM environmental SDEFILE should point to sde.sde 
REM environmental AUTHFILE should point to server authorization file
CALL c:\Progra~1\ArcGIS\Pro\bin\Python\scripts\propy.bat .\src\py\enable_gdb.py
CALL bash -c "./src/test/run-gdb-tests.sh"