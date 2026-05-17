\x1b[1;36mTLKC // Chapter 9: Compiling Terminal Handling Libraries (ncurses)\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Download & Build\x1b[0m
    \x1b[32m$ wget https://gnu.org && tar -xvzf ncurses-6.5.tar.gz\x1b[0m
    \x1b[32m$ mkdir ncurses-build && cd ncurses-build\x1b[0m
    \x1b[32m$ ../ncurses-6.5/configure --with-shared --with-termlib --enable-widec --with-versioned-syms --prefix=/usr\x1b[0m
    \x1b[32m$ make -j8 && make DESTDIR=$TLKC install && cd ..\x1b[0m

\x1b[1;33m2. Library Linkages & Caches\x1b[0m
    \x1b[32m$ cd root && ln -s libncursesw.so.6 lib/libncurses.so.6 && ln -s libtinfow.so.6 lib/libtinfo.so.6\x1b[0m
    \x1b[32m$ mkdir -p etc && nano etc/ld.so.conf\x1b[0m -> Append: /usr/lib and /usr/lib64
    \x1b[32m$ ldconfig -v -r ./\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Build execution script: \x1b[1;33mcurl tlkc.sh/ch10\x1b[0m
