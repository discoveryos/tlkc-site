\x1b[1;36m░▀█▀░█░░░█░█░█▀▀
░░█░░█░░░█▀▄░█░░
░░▀░░▀▀▀░▀░▀░▀▀▀\x1b[0m
\x1b[1;32mTHE LINUX KERNEL COMPILATION GUIDE (LFS Style)\x1b[0m
\x1b[90mMade by Kevin & Mathew | Discovery Open Source Software Foundation\x1b[0m
----------------------------------------------------------------------

Welcome to TLKC. This guide takes you straight under the hood of 
the Linux kernel, breaking down how to configure, optimize, and 
compile a completely tailored kernel entirely from source code.

\x1b[1;33mNAVIGATION MENU:\x1b[0m
    curl tlkc.vercel.app/ch1   - Chapter 1: Prerequisites & Source Setup
    curl tlkc.vercel.app/ch2   - Chapter 2: Customizing Kernel Subsystems
    curl tlkc.vercel.app/ch3   - Chapter 3: Compiling & Installing bzImage
    curl tlkc.vercel.app/ch4   - Chapter 4: Compiling Userland Shell (Bash)
    curl tlkc.vercel.app/ch5   - Chapter 5: Compiling Core Utilities (Coreutils)
    curl tlkc.vercel.app/ch6   - Chapter 6: Compiling Low-Level Tools (util-linux)
    curl tlkc.vercel.app/ch7   - Chapter 7: Compiling Text Editor (Nano)
    curl tlkc.vercel.app/ch8   - Chapter 8: Compiling System C Library (Glibc)
    curl tlkc.vercel.app/ch9   - Chapter 9: Compiling Interface Libraries (Ncurses)
    curl tlkc.vercel.app/ch10  - Chapter 10: Writing System Init
    curl tlkc.vercel.app/ch11  - Chapter 11: Disk Provisioning & GRUB Deploy
    curl tlkc.vercel.app/ch12  - Chapter 12: Internet From Scratch & iproute2

\x1b[90mRun any target shortcut from the list above to begin mapping your pipeline.\x1b[0m
