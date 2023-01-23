mov ah, 2
mov al, 20 ; Number of sectors we want to read
mov ch, 0 ; Cylender
mov cl, 2 ; Sector Number
mov dh, 0 ; Head Number
mov dl, [BOOTDISK] ; Drive Number
mov bx, KERNEL_LOCATION ; Where to load data
int 0x13