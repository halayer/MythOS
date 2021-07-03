; ==================
; FILE: MBR_stg1.asm
; ==================
;
; The first stage of the bootloader, residing in the MBR.
;
; Finds the first bootable partition, and jumps to it's first sector,
; where the stage 2 bootloader is located at.

use16
org 0x7C00  ; The MBR is loaded at 0x7C00 by the BIOS

    mov [drive_num], dl ; Save drive number

    ; Reset the drive
    mov ah, 0x00    ; INT 13h AH=00h: Reset Disk System
    int 0x13        ; BIOS interrupt INT 13h
    
    ; Read CHS parameters
    mov ah, 0x08    ; INT 13h AH=08h: Read Drive Parameters
.retry:
    int 0x13    ; BIOS interrupt INT 13h
    jc .retry

    inc dh
    mov [heads_per_cylinder], dh
    and cl, 0x3F
    mov [sectors_per_track], cl

    mov di, 0x7DBE

; Parse the partition table
parse_partition_table:
    mov al, [di]                ; Read the first byte of the partition table
    cmp al, 0x80                ; Check if bootable
    je boot_from_partition      ; If so, boot from the partition
    add di, 16                  ; Point to next partition table entry
    add bl, 1
    cmp di, 0x7DFE              ; Did we hit the last partition table entry?
    je no_bootable_partition    ; If so, show error message
    jmp parse_partition_table   ; Repeat

; Print out error message, if no bootable partition was found
no_bootable_partition:
    mov si, no_bootable_partition_found
    call print_string

    jmp halt

; Load the partition's bootsector, and jump into it
boot_from_partition:
    mov [partition_num], bl ; Save the partition we're booting from

    add di, 0x8 ; Point to the LBA of the partition's first sector

; Read the bootsector into memory
read_bootsector:
    ; Save the LBA of the partition's first sector, in order to
    ; later pass it to the second stage.
    mov cx, [di+2]
    mov [LBA+2], cx
    mov ax, [di]
    mov [LBA], ax

    ; Convert the LBA to CHS, since not all BIOSes support INT 13h AH=42h
    div BYTE [sectors_per_track]    ; LBA / Sectors per track
    mov cl, ah                      ; Sector = (LBA % Sectors per track) + 1
    inc cl                          ; Since the first sector is sector 1
    xor ah, ah                      ; Erase remainder
    div BYTE [heads_per_cylinder]   ; LBA / Sectors per track / Heads per cylinder
    mov dh, ah                      ; Head = (LBA / Sectors per track) % Heads per cylinder
    mov ch, al                      ; Cylinder = (LBA / Sectors per track) / Heads per cylinder
    mov dl, [drive_num]
    ;shl ah, 6                       ; Store the upper 2 bits of the 10 bit cylinder
    ;or cl, ah                       ;   in the upper 2 bits of the sector

    ; Read the first sector of the partition into 0x0:0x7E00
    xor bx, bx      ; ES:BX = Buffer Address Pointer = 0x0:0x7E00
    mov es, bx
    mov bx, 0x7E00
.retry:
    mov ah, 0x02    ; INT 13h AH=02h: Read Sectors From Drive
    mov al, 0x01    ; Read one sector, since it's THE bootSECTOR
    int 0x13        ; BIOS interrupt INT 13h
    jc .retry

; Jump into the bootsector
boot:
    xor cx, cx
    mov ds, cx  ; Clear segments
    mov es, cx
    mov ss, cx
    mov sp, 0xFF00

    ; Pass some "parameters"
    mov dh, [partition_num]         ; Partition & drive number
    mov dl, [drive_num]
    mov ax, [LBA]                   ; LBA of the partition's first sector
    mov bx, [LBA+2]
    mov cl, [sectors_per_track]     ; Sectors per track
    mov ch, [heads_per_cylinder]    ; Heads per cylinder

    jmp 0x0:0x7E00  ; Off we go into the second stage


include "bootutil.inc"


drive_num: db 0
partition_num: db 0
sectors_per_track: db 0
heads_per_cylinder: db 0
LBA: dd 0
no_bootable_partition_found: db "No bootable partition", 0
