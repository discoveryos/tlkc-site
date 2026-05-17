\x1b[1;36mTLKC // Chapter 11: Disk Image Provisioning & GRUB Bootloader\x1b[0m
----------------------------------------------------------------------
\x1b[1;33m1. Allocate and partition drive image\x1b[0m
    \x1b[32m$ dd if=/dev/zero of=disk.img bs=1M count=1024 && fdisk disk.img\x1b[0m -> Keys: n, p, 1, Enter, Enter, a, w

\x1b[1;33m2. Map interface, format and mount\x1b[0m
    \x1b[32m$ sudo losetup -fP --show disk.img\x1b[0m -> Take note of output node loop#
    \x1b[32m$ sudo mkfs.ext4 /dev/loop#p1 && sudo mount /dev/loop#p1 /mnt\x1b[0m
    \x1b[32m$ sudo cp -R root/* /mnt/\x1b[0m

\x1b[1;33m3. Setup GRUB Bootloader Configuration\x1b[0m
    \x1b[32m$ sudo grub-install --target=i386-pc --root-directory=/mnt --no-floppy --modules="normal part_msdos ext2 multiboot" /dev/loop#\x1b[0m
    \x1b[32m$ sudo nano /mnt/boot/grub/grub.cfg\x1b[0m

Paste menu definition code inside:
    menuentry 'TLKC' { set root='(hd0,1)' linux /boot/bzImage root=/dev/sda1 rw }

Unmount: 'sudo umount /mnt' and detach loopback: 'sudo losetup -d /dev/loop#'.
Run your system: \x1b[1;33mqemu-system-x86_64 disk.img\x1b[0m
