\x1b[1;36mTLKC // Chapter 2: Customizing Kernel Subsystems\x1b[0m
----------------------------------------------------------------------

With your base '.config' file generated, you need to use the interactive 
interface to manually enable vital display, storage, and device drivers.

Run 'make menuconfig' again if you closed it, then modify these pathways:

\x1b[1;33m1. Enable Storage & File System Support (Btrfs)\x1b[0m
Navigate here to ensure your target rootfs can read modern Btrfs storage layouts:

    File systems  --->
        <*> Btrfs filesystem support

\x1b[1;33m2. Enable Core USB Stack & Drivers\x1b[0m
Ensure standard human interface devices (keyboards/mice) and storage nodes work:

    Device Drivers  --->
        [*] USB support  --->
            <*>   Support for Host-side USB
            <*>   xHCI HCD (USB 3.0) support
            <*>   EHCI HCD (USB 2.0) support
            <*>   USB Mass Storage support

\x1b[1;33m3. Enable Display Stack (DRM) & Virtual Drivers\x1b[0m
Enable Direct Rendering Manager (DRM) options so graphics render flawlessly inside 
your QEMU testing virtual machine:

    Device Drivers  --->
        Graphics support  --->
            <*> Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) --->
            <*> DRM Support for Bochs DRM driver
            <*> Virtual Box Graphics Card

\x1b[1;33m4. Distro Hardware Integration: Graphics Drivers\x1b[0m
To support actual physical hardware like a standard linux distribution, 
enable the core open-source driver modules for major GPUs:

    Device Drivers  --->
        Graphics support  --->
            <M> Nouveau (nVidia Gallium acceleration driver)
            <M> AMD GPU
            [*]   Enable amdgpu support for Sea Islands GPUs
            [*]   Enable amdgpu support for Southern Islands GPUs
            <M> Intel 8xx/9xx/G3x/G4x/HD Graphics

\x1b[1;31m💡 Pro-tip:\x1b[0m Compiling these large GPU drivers as loadable modules (<M>) 
keeps your core vmlinuz kernel binary lightweight while letting the distribution 
dynamically spin up drivers on real hardware.

Once configured, select <Save> to overwrite your file configuration and exit.

----------------------------------------------------------------------
\x1b[1;32mNext Up:\x1b[0m Compile and deploy into your rootfs: \x1b[1;33mcurl tlkc.vercel.app/ch3\x1b[0m
