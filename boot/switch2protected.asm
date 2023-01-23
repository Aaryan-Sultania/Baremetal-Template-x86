cli
lgdt [GDT_Descriptor]

mov eax, cr0
or eax, 1
mov cr0, eax
jmp CODE_SEG:start_protected_mode

[bits 32]
start_protected_mode:
    jmp KERNEL_LOCATION
    