; ===============
; FILE: entry.asm
; ===============
;
; This assembly program always gets loaded by the stage 2 bootloader.
; It looks up where the kernel is in "oskernel.cfg", loads it, and does
; a far jump into protected mode into the kernel.


include "../x86_cmn/BPB.inc"

e_entry equ 24
e_phoff equ 28
e_phnum equ 44

p_offset equ 4
p_vaddr  equ 8
p_filesz equ 16

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

    mov ax, 0x10    ; Data Segment
    mov ss, ax
    mov ds, ax
    mov es, ax
    xor ax, ax

    ; Parse the program headers of the kernel ELF
    mov ebp, [0x9000+e_entry]  ; Entry Point
    mov cx, [0x9000+e_phnum]   ; Number of Program Headers
    mov esi, [0x9000+e_phoff]  ; Point to the program headers
    add esi, 0x9000

.parse_phdr:
    push cx

    mov eax, [esi]  ; p_type field of Phdr

    cmp al, 1
    jne .cont

    mov ebx, esi
    mov esi, [ebx+p_offset] ; If we found a PT_LOAD Phdr, read its p_offset
    add esi, 0x9000         ; Convert the file offset to its according address
    mov edi, [ebx+p_vaddr]  ; Read the p_vaddr field
    mov ecx, [ebx+p_filesz] ; Read the p_filesz field
    call cpy                ; Copy the data
    mov esi, ebx

.cont:
    add esi, 0x20   ; If not, point to the next Phdr
    pop cx
    dec cx
    jnz .parse_phdr ; Load all PT_LOAD Phdrs, until there are no more

    mov esp, 0x800000   ; Initialize the kernel stack
    jmp 0x08:kernel_jmp ; Use the new code segment from the GDT
kernel_jmp:
    ; When linking the kernel, 0x10000 is specified as the entry,
    ; therefore reading e_entry is not necessary.
    ; Since FASM doesn't allow mixing of 32-bit and 16-bit code in one file
    db 0xFF, 0xE5 ; jmp ebp

    jmp halt

cpy:
    cld
    db 0x67     ; Address Size Override Prefix
    rep movsb

    ret


include "../x86_cmn/FAT_mini.inc"
include "../x86_cmn/A20.inc"


cfg_file: db "KERNEL  CFG"

partition_num:      db 0
drive_num:          db 0
LBA:                dd 0
sectors_per_track:  dw 0
heads_per_cylinder: dw 0

include "GDT.inc"
