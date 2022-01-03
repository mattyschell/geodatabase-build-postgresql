#!/bin/bash
(python \
    ../geodatabase-creation-postgresql/src/test/run_test.py \
    "../geodatabase-creation-postgresql/src/test/major-release.sql" \
    "../geodatabase-creation-postgresql/src/test/major-release-expected" \
 ) || exit 1   
(python \
    ../geodatabase-creation-postgresql/src/test/run_test.py \
    "../geodatabase-creation-postgresql/src/test/postgis-is-installed.sql" \
    "../geodatabase-creation-postgresql/src/test/postgis-is-installed-expected" \
) || exit 1   
(python \
    ../geodatabase-creation-postgresql/src/test/run_test.py \
    "../geodatabase-creation-postgresql/src/test/sde-user-ready.sql" \
    "../geodatabase-creation-postgresql/src/test/sde-user-ready-expected" \
) || exit 1   
(python \
    ../geodatabase-creation-postgresql/src/test/run_test.py \
    "../geodatabase-creation-postgresql/src/test/sde-schema-ready.sql" \
    "../geodatabase-creation-postgresql/src/test/sde-schema-ready-expected" \
) || exit 1   
exit 0