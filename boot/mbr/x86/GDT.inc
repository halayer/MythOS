gdt:
gdt_null:   ; Null Descriptor
    dq 0

gdt_code:   ; Code Descriptor
    dw 0xFFFF       ; limit low
    dw 0            ; base low
    db 0            ; base middle
    db 10011010b    ; access
    db 11001111b    ; granularity
    db 0            ; base high

gdt_data:   ; Data Descriptor
    dw 0xFFFF
    dw 0
    db 0
    db 10010010b
    db 11001111b
    db 0

end_of_gdt:
gdt_ptr: 
    dw end_of_gdt - gdt - 1 ; Size of GDT
    dd gdt                  ; Base of GDT
