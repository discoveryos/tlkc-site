\x1b[1;36mTLKC // Chapter 12: Internet From Scratch (Networking Core & iproute2)\x1b[0m
----------------------------------------------------------------------

With your base operating system built, you now need to construct a networking 
infrastructure stack from scratch so your custom system can talk to the web.

\x1b[1;33m1. Host Dependencies & Starting Environment Image\x1b[0m
Ensure your host machine has capability headers, then pull the baseline workspace image:

    \x1b[32m$ sudo apt install libcap-dev\x1b[0m
    \x1b[32m$ wget https://cloudfront.net\x1b[0m
    \x1b[32m$ xz -d disk.img.xz\x1b[0m

Mount the disk filesystem image block onto your loopback layer to start staging data:

    \x1b[32m$ sudo losetup -fP --show disk.img\x1b[0m  \x1b[90m(Take note of the resulting loop#, e.g. /dev/loop0)\x1b[0m
    \x1b[32m$ sudo mount /dev/loop#p1 /mnt\x1b[0m     \x1b[90m(Replace # with your actual loop number)\x1b[0m

\x1b[1;33m2. Kernel Configuration Options for Core Network Support\x1b[0m
Fire up your kernel configuration dashboard ('make menuconfig') and ensure these crucial 
underlying kernel subsystems and driver layers are compiled into your custom image:

    [*] Networking support --->
        Networking options --->
            [*] Packet socket
            [*] Unix domain sockets
            [*] TCP/IP networking

    Device Drivers --->
        [*] Network device support --->
            [*] Ethernet driver support --->
                [*] Intel(R) PRO/1000 Gigabit Ethernet support

    File systems --->
        [*] Inotify support for userspace

Re-compile your target binary assets and shift the freshly derived bzImage right into your 
mounted rootfs storage layout framework:

    \x1b[32m$ make -j8\x1b[0m
    \x1b[32m$ sudo mv arch/x86/boot/bzImage /mnt/boot/\x1b[0m
    \x1b[32m$ cd ..\x1b[0m

\x1b[1;33m3. Compiling iproute2 for Low-Level Network Mapping\x1b[0m
Clone the primary Linux network configuration management toolkit and spin up configuration profiles:

    \x1b[32m$ git clone --depth 1 https://github.com\x1b[0m
    \x1b[32m$ cd iproute2\x1b[0m
    \x1b[32m$ ./configure --libbpf_force=off --prefix=/usr\x1b[0m
    \x1b[32m$ nano config.mk\x1b[0m

Inside the file matrix layout, disable SELinux by explicitly changing this flag:
    \x1b[34mHAVE_SELINUX:=n\x1b[0m

\x1b[90m(Exit your file matrix environment using: Ctrl-X, then Y, then Enter)\x1b[0m

Compile the binaries and audit your compiled object execution tree dependencies:

    \x1b[32m$ make -j8\x1b[0m
    \x1b[32m$ ldd ip/ip\x1b[0m

Redirect the primary network configuration binaries straight into your mounted system disk workspace:

    \x1b[32m$ sudo make DESTDIR="/mnt" install\x1b[0m
    \x1b[32m$ cd ..\x1b[0m

\x1b[1;33m4. Run System Validation Emulation via QEMU\x1b[0m
Commit cached system changes safely, flush unwritten block buffers, drop active interface bindings, 
and spawn your emulation matrix sandbox tool:

    \x1b[32m$ sync && sync && sync\x1b[0m
    \x1b[32m$ sudo umount /mnt\x1b[0m
    \x1b[32m$ sudo losetup -d /dev/loop#\x1b[0m
    \x1b[32m$ qemu-system-x86_64 disk.img\x1b[0m

Inside your custom booted terminal interface shell instance, verify your newly integrated tools execute:
    \x1b[32m$ ip\x1b[0m         -> (Should log functional manual helper fields)
    \x1b[32m$ ip link\x1b[0m    -> (Should correctly query network adapters)

\x1b[1;33m5. Building GNU Wget for Web Data Transmission\x1b[0m
Re-mount your target environment to proceed with userland feature extensions:

    \x1b[32m$ sudo losetup -fP --show disk.img\x1b[0m
    \x1b[32m$ sudo mount /dev/loop#p1 /mnt\x1b[0m

Fetch the official GNU wget source and configure its parameters. We specify OpenSSL explicitly 
to bypass GnuTLS dependencies which do not exist within our environment blueprint:

    \x1b[32m$ wget https://gnu.org\x1b[0m
    \x1b[32m$ tar -xvzf wget-latest.tar.gz\x1b[0m
    \x1b[32m$ mkdir wget-build && cd wget-build\x1b[0m
    \x1b[32m$ ../wget-1.25.0/configure --with-ssl=openssl --prefix=/usr\x1b[0m

Compile the web transmission manager and direct the final installation payload to your workspace mount point:

    \x1b[32m$ make -j8\x1b[0m
    \x1b[32m$ sudo make DESTDIR="/mnt" install\x1b[0m

Audit the binary file linkages using ldd to confirm the environment possesses the runtime shared assets:

    \x1b[32m$ ldd /mnt/bin/wget\x1b[0m

Required dynamic shared objects checked (verify their status on your local workspace system map):
    - libpcre2-8.so.0  (Regular expression pattern evaluation engine)
    - libuuid.so.1      (Universal unique identification tracking library)
    - libssl.so.3       (Core OpenSSL encryption runtime hooks)
    - libcrypto.so.3    (OpenSSL dynamic encryption algorithms backend)

    \x1b[32m$ cd ..\x1b[0m

\x1b[1;33m6. Troubleshooting Runtime Network Paths inside your custom OS (LFN)\x1b[0m
 Boot back into your environment. When attempting to start background dhcp or routing tools, 
 you might hit the following error:
    \x1b[31mdnsmasq: failed to open pidfile /var/run/dnsmasq.pid: No such file or directory\x1b[0m

 Because our environment lacks a runtime process tracking folder, create it manually:

    \x1b[32m$ mkdir -p /var/run\x1b[0m

 While inside your custom OS shell, configure your Domain Name System (DNS) resolver map 
 so web requests know how to translate target server addresses:

    \x1b[32m$ nano /etc/resolv.conf\x1b[0m

 Inside the file matrix layout, declare Cloudflare's public DNS target address:
    \x1b[34mnameserver 1.1.1.1\x1b[0m

 \x1b[90m(Exit your file matrix environment using: Ctrl-X, then Y, then Enter)\x1b[0m

 Flush your system caching buffers and restart your LFN sandbox simulation environment:

    \x1b[32m$ sync\x1b[0m
    \x1b[90m(Power cycle your QEMU execution container now)\x1b[0m

\x1b[1;33m7. The Final Internet Verification Check\x1b[0m
 Once back inside your custom operating system prompt, fire up your compiled download engine:

    \x1b[32m$ wget maplecircuit.dev\x1b[0m

 Your terminal will flag an authentication security check because we haven't loaded local SSL root cert bundles:
    \x1b[31mUnable to locally verify the issuer's authority\x1b[0m

 Bypass this localized certificate validator lookup checkpoint safely to finalize your network test:

    \x1b[32m$ wget maplecircuit.dev --no-check-certificate\x1b[0m
    \x1b[32m$ nano index.html\x1b[0m

 \x1b[1;32mIt works! Your custom OS is officially pull-streaming data from the web.\x1b[0m

----------------------------------------------------------------------
\x1b[1;33m8. Building ElfUtils to Resolve System Link Libraries\x1b[0m
 To resolve your remaining missing ELF tracking library objects, fetch the elfutils suite. 
 Alternatively, pull down the completed Phase 2 baseline file system image directly:
 
 \x1b[32m$ wget https://cloudfront.net\x1b[0m

 If performing manual construction, trigger your repository clone and bootstrap processes:

    \x1b[32m$ git clone --depth 1 git://sourceware.org/git/elfutils.git\x1b[0m
    \x1b[32m$ cd elfutils\x1b[0m
    \x1b[32m$ autoreconf -i -f\x1b[0m

 Step back, isolate a fresh workspace compile directory to protect your tracking paths, 
 and execute the configurations to link headers back to your base user prefix:

    \x1b[32m$ cd ..\x1b[0m
    \x1b[32m$ mkdir elfutils-build && cd elfutils-build\x1b[0m
    \x1b[32m$ ../elfutils/configure --prefix=/usr --disable-debuginfod --enable-libdebuginfod=no\x1b[0m

 Run the compilation cycle using parallel processing cores and redirect installation onto your mount:

    \x1b[32m$ make -j8\x1b[0m
    \x1b[32m$ sudo make DESTDIR="/mnt" install\x1b[0m
    \x1b[32m$ cd ..\x1b[0m

----------------------------------------------------------------------
\x1b[1;32mFantastic Work!\x1b[0m Your custom internet layer development environment is completely built.
