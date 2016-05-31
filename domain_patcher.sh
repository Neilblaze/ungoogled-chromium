#!/bin/bash

# A script that prints a patch for replacing domains

read -r -d '' make_diff_script << EOF
printf -- '--- a/{}\n+++ b/{}\n'
sed -r \
-e 's/google([A-Za-z\-]*)\.com/9oo91e\1\.qjz9zk/g' \
-e 's/gstatic([A-Za-z\-]*)\.com/95tat1c\1\.qjz9zk/g' \
-e 's/chrome([A-Za-z\-]*)\.com/ch40me\1\.qjz9zk/g' \
-e 's/chromium([A-Za-z\-]*)\.org/ch40m1um\1\.qjz9zk/g' \
-e 's/mozilla([A-Za-z\-]*)\.org/m0z111a\1\.qjz9zk/g' \
-e 's/facebook([A-Za-z\-]*)\.com/f8c3b00k\1\.qjz9zk/g' \
-e 's/appspot([A-Za-z\-]*)\.com/8pp2p8t\1\.qjz9zk/g' \
-e 's/youtube([A-Za-z\-]*)\.com/y0u1ub3\1\.qjz9zk/g' \
-e 's/ytimg([A-Za-z\-]*)\.com/yt1mg\1\.qjz9zk/g' \
-e 's/gmail([A-Za-z\-]*)\.com/9ma1l\1\.qjz9zk/g' \
-e 's/doubleclick([A-Za-z\-]*)\.net/60u613cl1c4\1\.qjz9zk/g' \
-e 's/googlezip\.net/9oo91e21p\.qjz9zk/g' \
-e 's/beacons([1-9]?)\.gvt([1-9]?)\.com/b3ac0n2\1\.9vt\2\.qjz9zk/g' \
-e 's/microsoft\.com/m1cr050ft\.qjz9zk/g' '{}' | diff -U 0 '{}' - | tail --lines=+3
EOF


find . -path ./debian -prune \
-o -type f \( -name "*.h" \
    -o -name "*.hh" \
    -o -name "*.hpp" \
    -o -name "*.hxx" \
    -o -name "*.cc" \
    -o -name "*.cpp" \
    -o -name "*.cxx" \
    -o -name "*.c" \
    -o -name "*.h" \
    -o -name "*.json" \
    -o -name "*.js" \
    -o -name "*.html" \
    -o -name "*.htm" \
    -o -name "*.py*" \
    -o -name "*.grd" \
    -o -name "*.sql" \
    -o -name "*.idl" \
    -o -name "*.mk" \
    -o -name "*.gyp*" \
    -o -name "Makefile" \
    -o -name "makefile" \
    -o -name "*.txt" \
    -o -name "*.xml" \
    -o -name "*.mm" \
    -o -name "*.jinja*" \) \
-printf '%P\n' | xargs -L1 -I{} sh -c "$make_diff_script"
