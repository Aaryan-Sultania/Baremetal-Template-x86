GDT_Start:
    null_desc:
        dd 0
        dd 0
    code_desc:
        dw 0xffff ;first 16 bits of limit
        dw 0
        db 0 ; first 24 bits of the base
        db 10011010b ; type flags
        db 11001111b ; Other flags and last four bits of limit
        db 0 ; last 8 bits of base
    data_desc:
        dw 0xffff ;first 16 bits of limit
        dw 0
        db 0 ; first 24 bits of the base
        db 10010010b ; type flags
        db 11001111b ; Other flags and last four bits of limit
        db 0 ; last 8 bits of base
GDT_End:
GDT_Descriptor:
    dw GDT_End - GDT_Start - 1
    dd GDT_Start
    
CODE_SEG equ code_desc - GDT_Start
DATA_SEG equ data_desc - GDT_Start