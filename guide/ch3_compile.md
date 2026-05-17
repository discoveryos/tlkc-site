\x1b[1;36mTLKC // Chapter 3: Compiling & Staging\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Compile the source tree\x1b[0m
    \x1b[32m$ make -j8\x1b[0m

\x1b[1;33m2. Extract and stage the Kernel Image (bzImage)\x1b[0m
    \x1b[32m$ mv arch/x86/boot/bzImage ..\x1b[0m
    \x1b[32m$ cd ..\x1b[0m
    \x1b[32m$ mv bzImage root/boot/\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Build your first userland tool shell: \x1b[1;33mcurl tlkc.vercel.app/ch4\x1b[0m
