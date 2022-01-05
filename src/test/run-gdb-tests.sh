#!/bin/bash
./src/test/run-db-tests.sh
(python \
    ./src/test/run_test.py \
    "./src/test/sde-dbtune-geometry-storage-is-pg-geometry.sql" \
    "./src/test/sde-dbtune-geometry-storage-is-pg-geometry-expected" \
) || exit 1   
exit 0