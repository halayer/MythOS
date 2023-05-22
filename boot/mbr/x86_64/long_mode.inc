; esi : Page Directory Base Address (Must be 16-byte aligned)
enable_long_mode:
    ; Disable Interrupts
    cli

    ; Enable Physical-Address Extensions (CR4.PAE := 1)
    mov eax, cr4
    or eax, 0x20
    mov cr4, eax

    ; Load CR3 (Page Directory Base Address)
    mov cr3, esi

    ; Enable Long Mode (EFER.LME := 1)
    mov ecx, 0xC0000080
    rdmsr
    or eax, 0x100
    wrmsr

    ret
