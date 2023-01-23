bin/os.bin: bin/os_missing_zeros.bin
	cat bin/os_missing_zeros.bin bin/zeros.bin > bin/os.bin
bin/os_missing_zeros.bin: bin/boot.bin bin/kernel.bin
	cat bin/boot.bin bin/kernel.bin > bin/os_missing_zeros.bin
bin/boot.bin: boot/*.asm
	nasm -f bin boot/boot.asm -o bin/boot.bin
bin/kernel.bin: obj/kernel/kernel.o obj/kernel/kernel_entry.o
	i386-elf-ld -o "bin/kernel.bin" -Ttext 0x1000 obj/kernel/*.o --oformat binary
obj/kernel/kernel_entry.o: kernel/kernel_entry.asm
	 nasm "kernel/kernel_entry.asm" -f elf -o "obj/kernel/kernel_entry.o"
obj/kernel/kernel.o: kernel/kernel.cpp
	 i386-elf-g++ -ffreestanding -m32 -c "kernel/kernel.cpp" -o "obj/kernel/kernel.o"
