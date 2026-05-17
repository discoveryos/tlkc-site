\x1b[1;36mTLKC // Chapter 1: System Prerequisites & Dependencies\x1b[0m
----------------------------------------------------------------------

Before building the kernel, you need to pull down the compiler layers, 
initialize your target root filesystem directory layout, and grab the source.

\x1b[1;33m1. Pull development headers & packages\x1b[0m
Run this to grab your compiler dependencies (Ubuntu/Debian systems):

    \x1b[32m$ sudo apt update && sudo apt install bc binutils bison dwarves \x1b[0m
    \x1b[32m  flex gcc git gnupg2 gzip libelf-dev libncurses5-dev libssl-dev \x1b[0m
    \x1b[32m  make openssl pahole perl-base rsync tar xz-utils autoconf \x1b[0m
    \x1b[32m  gperf autopoint texinfo texi2html gettext gawk bzip2 \x1b[0m
    \x1b[32m  qemu-system-x86 libtool\x1b[0m

\x1b[1;33m2. Initialize the LFS Root File System (rootfs)\x1b[0m
Build your workspace environment and configure the modern usr-merge path structure:

    \x1b[32m$ mkdir -p TLKC/root && cd TLKC/root\x1b[0m
    \x1b[32m$ mkdir -p boot proc sys dev usr/lib usr/lib64 usr/bin usr/sbin\x1b[0m
    \x1b[32m$ ln -s usr/lib lib && ln -s usr/lib64 lib64\x1b[0m
    \x1b[32m$ ln -s usr/bin bin && ln -s usr/sbin sbin\x1b[0m
    \x1b[32m$ cd .. && export TLKC="$(pwd)/root"\x1b[0m

\x1b[1;33m3. Clone the Kernel Source Tree & Initialize Config\x1b[0m
Grab a lightweight clone of the official Linux tree and spawn your initial baseline settings:

    \x1b[32m$ git clone --depth 1 https://github.com\x1b[0m
    \x1b[32m$ cd linux\x1b[0m
    \x1b[32m$ make defconfig\x1b[0m
    \x1b[32m$ make menuconfig\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Review detailed driver modifications: \x1b[1;33mcurl tlkc.sh/ch2\x1b[0m
