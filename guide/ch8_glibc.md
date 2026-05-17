\x1b[1;36mTLKC // Chapter 8: Compiling the Core C Library (glibc)\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Clone & Configure\x1b[0m
    \x1b[32m$ git clone --depth 1 https://sourceware.org\x1b[0m
    \x1b[32m$ mkdir glibc-build && cd glibc-build\x1b[0m
    \x1b[32m$ ../glibc/configure --libdir=/lib --prefix=/usr\x1b[0m

\x1b[1;33m2. Compile Runtime System\x1b[0m
    \x1b[32m$ make -j8 && make DESTDIR=$TLKC install && cd ..\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Configure terminal screen libs: \x1b[1;33mcurl tlkc.sh/ch9\x1b[0m
