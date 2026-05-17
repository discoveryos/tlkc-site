\x1b[1;36mTLKC // Chapter 7: Compiling the Terminal Text Editor (GNU nano)\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Clone & Bootstrap\x1b[0m
    \x1b[32m$ git clone --depth 1 git://git.savannah.gnu.org/nano.git\x1b[0m
    \x1b[32m$ mkdir nano-build && cd nano && ./autogen.sh && cd ..\x1b[0m

\x1b[1;33m2. Build Editor\x1b[0m
    \x1b[32m$ cd nano-build\x1b[0m
    \x1b[32m$ ../nano/configure --prefix=/usr\x1b[0m
    \x1b[32m$ make -j8 && make DESTDIR=$TLKC install && cd ..\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Build library: \x1b[1;33mcurl tlkc.sh/ch8\x1b[0m
