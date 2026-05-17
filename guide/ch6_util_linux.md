\x1b[1;36mTLKC // Chapter 6: Compiling Low-Level System Utilities (util-linux)\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Clone & Autogen\x1b[0m
    \x1b[32m$ git clone --depth 1 https://github.com\x1b[0m
    \x1b[32m$ mkdir util-build && cd util-linux && ./autogen.sh && cd ..\x1b[0m

\x1b[1;33m2. Configure & Build\x1b[0m
    \x1b[32m$ cd util-build\x1b[0m
    \x1b[32m$ ../util-linux/configure --disable-liblastlog2 --prefix=/usr\x1b[0m
    \x1b[32m$ make -j8 && make DESTDIR=$TLKC install && cd ..\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Build text editor: \x1b[1;33mcurl tlkc.vercel.app/ch7\x1b[0m
