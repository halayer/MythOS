; Identity maps the first gigabyte of memory with the PML4T residing at 0x0000
setup_paging:
    ; Zero out the PML4T, PDPT and PDT
    xor edi, edi
    xor eax, eax
    mov ecx, 3 * 1024
    cld
    rep stosd

    ; PML4T[0] := 0x1000 | PAGE_PRESENT | READ_WRITE
    mov eax, 0x1003
    mov [0x0000], eax

    ; PDPT[0] := 0x2000 | PAGE_PRESENT | READ_WRITE
    add eax, 0x1000
    mov [0x1000], eax

    ; Identity map the first gigabyte in the PDT
    mov ecx, 512
    mov eax, 0x83 ; PAGE_2MB | PAGE_PRESENT | READ_WRITE
    mov edi, 0x2000
.identity_map:
    mov [edi], eax           ; Write current entry of the PDT
    add eax, 2 * 1024 * 1024 ; Point to the next 2 MB
    add edi, 8               ; Advance to next entry of the PDT
    loop .identity_map       ; Repeat 512 times

    ret
