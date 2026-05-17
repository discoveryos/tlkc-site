#!/bin/bash
set -e

echo "[+] Step 1: Installing Host System Dependencies..."
sudo apt update && sudo apt install -y bc binutils bison dwarves flex gcc git \
  gnupg2 gzip libelf-dev libncurses5-dev libssl-dev make openssl pahole \
  perl-base rsync tar xz-utils autoconf gperf autopoint texinfo texi2html \
  gettext gawk bzip2 qemu-system-x86 libtool

echo "[+] Step 2: Preparing Root Filesystem Layout..."
mkdir -p TLKC/root
cd TLKC/root
mkdir -p boot proc sys dev usr/lib usr/lib64 usr/bin usr/sbin
ln -sf usr/lib lib
ln -sf usr/lib64 lib64
ln -sf usr/bin bin
ln -sf usr/sbin sbin
cd ..
export TLKC="$(pwd)/root"

echo "[+] Step 3: Cloning Kernel and Initializing Configurations..."
if [ ! -d "linux" ]; then
    git clone --depth 1 https://github.com/torvalds/linux.git
fi
cd linux
make defconfig
scripts/config --enable CONFIG_BTRFS_FS
scripts/config --enable CONFIG_USB_SUPPORT
scripts/config --enable CONFIG_USB_XHCI_HCD
scripts/config --enable CONFIG_USB_EHCI_HCD
scripts/config --enable CONFIG_USB_STORAGE
scripts/config --enable CONFIG_DRM_BOCHS
scripts/config --module CONFIG_DRM_NOUVEAU
scripts/config --module CONFIG_DRM_AMDGPU
scripts/config --enable CONFIG_DRM_AMDGPU_SI
scripts/config --enable CONFIG_DRM_AMDGPU_CI
scripts/config --module CONFIG_DRM_I915
make olddefconfig

echo "[+] Step 4: Compiling Linux Kernel Image..."
make -j8
mv arch/x86/boot/bzImage ..
cd ..
mv bzImage root/boot/

echo "[+] Step 5: Building Userland Utilities (GNU Bash)..."
if [ ! -d "bash" ]; then
    git clone --depth 1 https://gnu.org
fi
mkdir -p bash-build && cd bash-build
../bash/configure --prefix=/usr
make -j8
make DESTDIR="$TLKC" install
cd ..
ln -sf bash root/bin/sh

echo "[+] Step 6: Building System Core (GNU Coreutils)..."
if [ ! -d "coreutils" ]; then
    git clone --depth 1 https://github.com
fi
cd coreutils
./bootstrap
cd ..
mkdir -p coreutils-build && cd coreutils-build
../coreutils/configure --without-selinux --disable-libcap --prefix=/usr
make -j8
make DESTDIR="$TLKC" install
cd ..

echo "[+] Step 7: Building Storage and Hardware Utilities (util-linux)..."
if [ ! -d "util-linux" ]; then
    git clone --depth 1 https://github.com
fi
cd util-linux
./autogen.sh
cd ..
mkdir -p util-build && cd util-build
../util-linux/configure --disable-liblastlog2 --prefix=/usr
make -j8
make DESTDIR="$TLKC" install
cd ..

echo "[+] Step 8: Building Editor Workspace (GNU nano)..."
if [ ! -d "nano" ]; then
    git clone --depth 1 git://git.savannah.gnu.org/nano.git
fi
cd nano
./autogen.sh
cd ..
mkdir -p nano-build && cd nano-build
../nano/configure --prefix=/usr
make -j8
make DESTDIR="$TLKC" install
cd ..

echo "[+] Step 9: Compiling System Link Libraries (glibc)..."
if [ ! -d "glibc" ]; then
    git clone --depth 1 https://sourceware.org
fi
mkdir -p glibc-build && cd glibc-build
../glibc/configure --libdir=/lib --prefix=/usr
make -j8
make DESTDIR="$TLKC" install
cd ..

echo "[+] Step 10: Injecting Character Term Interfaces (ncurses)..."
if [ ! -f "ncurses-6.5.tar.gz" ]; then
    wget https://gnu.org
    tar -xvzf ncurses-6.5.tar.gz
fi
mkdir -p ncurses-build && cd ncurses-build
../ncurses-6.5/configure --with-shared --with-termlib --enable-widec --with-versioned-syms --prefix=/usr
make -j8
make DESTDIR="$TLKC" install
cd ..

echo "[+] Step 11: Mapping Mappings & Caches..."
cd root
ln -sf libncursesw.so.6 lib/libncurses.so.6
ln -sf libtinfow.so.6 lib/libtinfo.so.6
mkdir -p etc
echo -e "/usr/lib\n/usr/lib64" > etc/ld.so.conf
sudo ldconfig -v -r ./

echo "[+] Step 12: Installing System Init Entry Point..."
echo -e "#!/bin/bash\nmount -t proc none /proc\nmount -t sysfs none /sys\nexec /bin/bash" > sbin/init
chmod +x sbin/init
cd ..

echo "[+] Step 13: Allocating Raw Disk Image Block & Structuring Partitions..."
dd if=/dev/zero of=disk.img bs=1M count=1024
echo -e "n\np\n1\n\n\na\nw" | fdisk disk.img
LOOP_DEV=$(sudo losetup -fP --show disk.img)
sudo mkfs.ext4 "${LOOP_DEV}p1"
sudo mkdir -p /mnt/tlkc_mount
sudo mount "${LOOP_DEV}p1" /mnt/tlkc_mount
sudo cp -R root/* /mnt/tlkc_mount/

echo "[+] Step 14: Finalizing GRUB Deployment Layer..."
sudo grub-install --target=i386-pc --root-directory=/mnt/tlkc_mount --no-floppy \
  --modules="normal part_msdos ext2 multiboot" "${LOOP_DEV}"
sudo mkdir -p /mnt/tlkc_mount/boot/grub
sudo sh -c 'echo -e "menuentry \"TLKC\" {\n    set root=\"(hd0,1)\"\n    linux /boot/bzImage root=/dev/sda1 rw\n}" > /mnt/tlkc_mount/boot/grub/grub.cfg'

sudo umount /mnt/tlkc_mount
sudo losetup -d "${LOOP_DEV}"
echo "[🎉] SUCCESS: TLKC OS BUILD COMPLETED!"
