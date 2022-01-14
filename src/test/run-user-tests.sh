#!/bin/bash
(python \
    ./src/test/run_test.py \
    "./src/test/gdb-user-ready.sql" \
    "./src/test/gdb-user-ready-expected" \
) || exit 1   
exit 0