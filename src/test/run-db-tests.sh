#!/bin/bash
(python \
    ./src/test/run_test.py \
    "./src/test/major-release.sql" \
    "./src/test/major-release-expected" \
 ) || exit 1   
(python \
    ./src/test/run_test.py \
    "./src/test/postgis-is-installed.sql" \
    "./src/test/postgis-is-installed-expected" \
) || exit 1   
(python \
    ./src/test/run_test.py \
    "./src/test/sde-user-ready.sql" \
    "./src/test/sde-user-ready-expected" \
) || exit 1   
(python \
    ./src/test/run_test.py \
    "./src/test/sde-schema-ready.sql" \
    "./src/test/sde-schema-ready-expected" \
) || exit 1   
exit 0