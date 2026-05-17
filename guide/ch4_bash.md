\x1b[1;36mTLKC // Chapter 4: Compiling the Userland Shell (GNU Bash)\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Clone GNU Bash\x1b[0m
    \x1b[32m$ git clone --depth 1 https://gnu.org\x1b[0m

\x1b[1;33m2. Configure and Compile\x1b[0m
    \x1b[32m$ mkdir bash-build && cd bash-build\x1b[0m
    \x1b[32m$ ../bash/configure --prefix=/usr\x1b[0m
    \x1b[32m$ make -j8 && make DESTDIR=$TLKC install && cd ..\x1b[0m

\x1b[1;33m3. Symlink Standard Wrapper\x1b[0m
    \x1b[32m$ ln -s bash root/bin/sh\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Build core utils: \x1b[1;33mcurl tlkc.sh/ch5\x1b[0m
