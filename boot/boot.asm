[org 0x7c00]

KERNEL_LOCATION equ 0x1000

mov [BOOTDISK], dl

xor ax, ax
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp

%include "boot/disk.asm"

mov ah, 0x0
mov al, 0x3
int 0x10 ; Clear Screen

%include "boot/switch2protected.asm"

BOOTDISK: db 0
%include "boot/gdt.asm"

times 510-($-$$) db 0
db 0x55, 0xaa