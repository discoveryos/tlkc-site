\x1b[1;36mTLKC // Chapter 10: Writing the System Initialization Process (init)\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Create init file\x1b[0m
    \x1b[32m$ nano sbin/init\x1b[0m

Paste inside:
    \x1b[34m#!/bin/bash\x1b[0m
    \x1b[34mmount -t proc none /proc\x1b[0m
    \x1b[34mmount -t sysfs none /sys\x1b[0m
    \x1b[34mexec /bin/bash\x1b[0m

\x1b[1;33m2. Set execution flags\x1b[0m
    \x1b[32m$ chmod +x sbin/init && cd ..\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Package onto drive image: \x1b[1;33mcurl tlkc.sh/ch11\x1b[0m
