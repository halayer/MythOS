; ===============
; FILE: entry.asm
; ===============
;
; This assembly program always gets loaded by the stage 2 bootloader.
; It looks up where the kernel is in "oskernel.cfg", loads it, and does
; a far jump into protected mode into the kernel.


include "../x86_cmn/BPB.inc"

e_entry equ 24
e_phoff equ 32
e_phnum equ 56

p_offset equ 8
p_vaddr  equ 16
p_filesz equ 32

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
setup:
    ; Enable A20
    call A20_enable

    ; Setup identity paging
    call setup_paging

    ; Move into long mode
    xor esi, esi
    call enable_long_mode

    ; Enable Paging and protection (CR0.PG, CR0.PE := 1)
    mov eax, cr0
    or eax, 0x80000001
    mov cr0, eax

    lgdt [gdt_ptr]

    jmp 0x8:.long

.long:
    db 0x66, 0xB8, 0x10, 0x00;mov ax, 0x10    ; Data Segment
    mov ss, ax
    mov ds, ax
    mov es, ax
    xor ax, ax

    ; Parse the program headers of the kernel ELF
    ; only using the A register allows for absolute addressing in long mode
    db 0x48, 0x8B, 0x2C, 0x25, 0x18, 0x90, 0x00, 0x00;mov rbp, [0x9000+e_entry]              ; Entry Point
    db 0x66, 0xA1, 0x38, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00;mov ax, [0x9000+e_phnum]   ; Number of Program Headers
    db 0x66, 0x89, 0xC1;mov cx, ax
    db 0x48, 0xA1, 0x20, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00;mov rax, [0x9000+e_phoff]  ; Point to the program headers
    db 0x48, 0x89, 0xC3;mov rbx, rax
    db 0x48, 0x81, 0xC3, 0x00, 0x90, 0x00, 0x00;add rbx, 0x9000

.parse_phdr:
    db 0x66
    push cx

    db 0x8B, 0x03;mov eax, [rbx]  ; p_type field of Phdr

    cmp al, 1
    jne .cont

    db 0x48, 0x8B, 0x73, 0x08;mov rsi, [rbx+p_offset]           ; If we found a PT_LOAD Phdr, read its p_offset
    db 0x48, 0x81, 0xC6, 0x00, 0x90, 0x00, 0x00;add rsi, 0x9000 ; Convert the file offset to its according address
    db 0x48, 0x8B, 0x7B, 0x10;mov rdi, [rbx+p_vaddr]            ; Read the p_vaddr field
    db 0x48, 0x8B, 0x4B, 0x20;mov rcx, [rbx+p_filesz]           ; Read the p_filesz field
    db 0xF3, 0xA4;rep movsb                                     ; Copy the data

.cont:
    db 0x48, 0x83, 0xC3, 0x38;add rbx, 0x20   ; If not, point to the next Phdr
    db 0x66, 0x59;pop cx
    db 0x66, 0xFF, 0xC9;dec cx
    jnz .parse_phdr ; Load all PT_LOAD Phdrs, until there are no more

    db 0x48, 0xC7, 0xC4, 0x00, 0x00, 0x80, 0x00;mov rsp, 0x800000 ; Initialize the kernel stack
kernel_jmp:
    ; When linking the kernel, 0x10000 is specified as the entry,
    ; therefore reading e_entry is not necessary.
    ; Since FASM doesn't allow mixing of 64-bit and 16-bit code in one file
    db 0xFF, 0xE5 ; jmp rbp

    jmp halt


include "../x86_cmn/FAT_mini.inc"
include "../x86_cmn/A20.inc"
include "long_mode.inc"
include "paging.inc"

cfg_file: db "KERNEL  CFG"

partition_num:      db 0
drive_num:          db 0
LBA:                dd 0
sectors_per_track:  dw 0
heads_per_cylinder: dw 0

align 4
    dw 0

gdt:
gdt_null:   ; Null Descriptor
    dq 0

gdt_code:   ; Code Descriptor
    dq 0x00209A0000000000

gdt_data:   ; Data Descriptor
    dq 0x0000920000000000

end_of_gdt:
gdt_ptr:
    dw end_of_gdt - gdt - 1 ; Size of GDT
    dd gdt                  ; Base of GDT

