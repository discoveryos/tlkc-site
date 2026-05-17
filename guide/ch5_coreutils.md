\x1b[1;36mTLKC // Chapter 5: Compiling the Core Utilities (GNU Coreutils)\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Clone & Bootstrap\x1b[0m
    \x1b[32m$ git clone --depth 1 https://github.com\x1b[0m
    \x1b[32m$ mkdir coreutils-build && cd coreutils && ./bootstrap && cd ..\x1b[0m

\x1b[1;33m2. Configure & Deploy\x1b[0m
    \x1b[32m$ cd coreutils-build\x1b[0m
    \x1b[32m$ ../coreutils/configure --without-selinux --disable-libcap --prefix=/usr\x1b[0m
    \x1b[32m$ make -j8 && make DESTDIR=$TLKC install && cd ..\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Build system tools: \x1b[1;33mcurl tlkc.vercel.app/ch6\x1b[0m
