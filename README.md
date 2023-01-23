# Baremetal-Template-x86
x86 Baremetal project template. Includes a boot-loader that switches to 32 bit protected mode, small kernel that can print strings, and a Makefile for building it all. This template is specific to MacOS 
To use this template, you must install qemu, nasm, and i386-elf-gcc with MacPorts
```
sudo port install qemu nasm i386-elf-gcc
```
Once you have those installed, you may build and run the project with:
```
bash run.sh
```
This file runs make and launches qemu
