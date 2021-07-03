; ===============
; FILE: entry.asm
; ===============
;
; This assembly program always gets loaded by the stage 2 bootloader.
; It looks up where the kernel is in "oskernel.cfg", loads it, and does
; a far jump into protected mode into the kernel.


include "boot/BPB.inc"

;use16
org 0x8000

    ; Save the parameters passed by stage 2
    mov [drive_num], dl             ; Drive number
    mov [partition_num], dh         ; Partition number
    mov [LBA], ax                   ; LBA of the start sector of this partition
    mov [LBA+2], bx
    mov [sectors_per_track], cl     ; Sectors per track
    mov [heads_per_cylinder], ch    ; Heads per cylinder

    xor ax, ax  ; Clear registers
    xor bx, bx
    xor cx, cx
    xor dx, dx

    call FAT_mini_init  ; Initialize the mini driver

    ; Load the config file
    mov si, cfg_file    ; Search for the config file
    call search_file
    mov bx, 0x7C00      ; Load the file at 0x0:0x7C00
    call read_file

    ; Load the kernel
    mov si, 0x7C00      ; Search for the kernel specified in the config file
    call search_file
    mov bx, 0x9000      ; Load the kernel file at 0x0:0x9000
    call read_file

; Prepare for jumping into the kernel, e.g. moving into protected mode,
; enabling A20 ...
.setup:
    call A20_enable ; Enable A20

    ; Move into protected mode
    cli
    lgdt [gdt_ptr]
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    mov ax, 0x10
    mov ss, ax
    mov ds, ax
    mov es, ax
    xor ax, ax

    ; Parse the program headers of the kernel ELF
    mov esi, 0x9000     ; Point to the ELF header of the file
    mov cx, [esi+44]    ; Number of program headers
    mov esi, [esi+28]   ; Point to the program headers
    add esi, 0x9000

.parse_phdr:
    push cx

    mov eax, [esi]  ; p_type field of Phdr

    cmp al, 1
    jne .cont

    mov eax, [esi+4]
    add eax, 0x9000
    mov ebx, [esi+8]
    mov ecx, [esi+16]
    call cpy

.cont:
    add esi, 0x20
    pop cx
    dec cx
    jnz .parse_phdr

    mov esp, 0x800000
    jmp 0x08:kernel_jmp
kernel_jmp:
    ; Since FASM doesn't allow mixing of 32-bit and 16-bit code in one file
    db 0xEA, 0x00, 0x00, 0x01, 0x00, 0x08, 0x00 ; jmp 0x8:0x10000

    jmp halt

cpy:
    dec ecx

    mov dl, [eax+ecx]
    mov [ebx+ecx], dl

    jnz cpy

    ret


print_int:
    add al, "0"
    mov ah, 0x0E
    xor bh, bh
    int 0x10
    sub al, "0"
    ret


include "FAT_mini.inc"
include "A20.inc"


cfg_file: db "KERNEL  CFG"

partition_num:      db 0
drive_num:          db 0
LBA:                dd 0
sectors_per_track:  dw 0
heads_per_cylinder: dw 0

include "GDT.inc"
